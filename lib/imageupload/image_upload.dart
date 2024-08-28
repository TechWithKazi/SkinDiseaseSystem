// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:skin_detection_system/disease_information/BulleyRashInfo.dart';
import 'package:skin_detection_system/disease_information/Melanocytic_Nevi_Info.dart';
import 'package:skin_detection_system/disease_information/Melanoma_info.dart';
import 'package:skin_detection_system/disease_information/MoneyPox_Info.dart';
import 'package:skin_detection_system/disease_information/Seborrheic_Keratoses.dart';

// ignore: must_be_immutable

class ImageUpload extends StatefulWidget {
  final String? userid;

  ImageUpload({super.key, this.userid});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;
  double confidence = 0.0;
  String label = '';
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  Timer? _loadingTimer;
  bool _isUploading = false;
  late BuildContext _dialogContext;

  @override
  void initState() {
    super.initState();
    label = ' ';
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  Future<void> _uploadImage(File imageFile) async {
    _startLoadingTimer();
    setState(() {
      _isLoading = true;
    });

    const String url =
        'https://us-central1-named-totality-425609-d4.cloudfunctions.net/predict';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> data = json.decode(responseBody);
        print('Prediction result: $data');

        if (data.containsKey('class') && data.containsKey('confidence')) {
          double fetchedConfidence = (data['confidence'] as num).toDouble();
          setState(() {
            if (fetchedConfidence < 50) {
              label = 'No disease detected';
              confidence = 100;
            } else {
              label = data['class'];
              confidence = fetchedConfidence;
            }
          });
        } else {
          // Invalid prediction result
          setState(() {
            label = 'No disease detected';
            confidence = 100;
          });
        }
      } else {
        print('Failed to upload image: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      _loadingTimer?.cancel();
      Navigator.of(_dialogContext).pop(); // Dismiss the alert dialog if shown
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImage() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
        await _uploadImage(image!);
      } else {
        print('No image selected.');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startLoadingTimer() {
    _loadingTimer?.cancel(); // Cancel any existing timer
    _loadingTimer = Timer(const Duration(seconds: 25), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          _dialogContext = context;
          return const AlertDialog(
            title: Text('Processing'),
            content: Text('Please wait, your image is being processed..'),
          );
        },
      );
      Future.delayed(const Duration(seconds: 7), () {
        if (Navigator.of(_dialogContext).canPop()) {
          Navigator.of(_dialogContext).pop(); // Dismiss the alert dialog
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;
    final screenHieght = MediaQuery.of(this.context).size.height;

    // Calculate the actual padding based on the screen width
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth * 0.02;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Skin Disease",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.052),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Detection System",
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.052),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Upload Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.052),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color.fromARGB(255, 167, 76, 153),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: image == null
                                  ? const Center(
                                      child: Text("No Image selected"),
                                    )
                                  : Image.file(image!),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Label : $label",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "The Confidence is : ${confidence.toStringAsFixed(0)}%",
                              style: const TextStyle(fontSize: 20),
                            ),
                            if (_isLoading)
                              const CircularProgressIndicator(), // Show loading indicator when loading
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _pickImage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 167, 76, 153),
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text("Select Image"),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    if (label == "Melanoma") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MelanomaInfo()));
                                    } else if (label == "Melanocytic Nevi") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MelanocyticNeviInfo()));
                                    } else if (label ==
                                        "Seborrheic Keratoses") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Seborrheic_Keratoses_Info()));
                                    } else if (label == "Monkey Pox") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MonekeyPoxInfo()));
                                    } else if (label == "bulleye rash") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BulleyRashInfo()));
                                    } else if (label == "normal skin") {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Image normal skin'),
                                              content: const Text(
                                                  'No need for diagnosis..'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false); // Cancel
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                              ],
                                            );
                                          });
                                    } else if (label == "not a skin disease") {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Image upload  not a skin disease'),
                                              content: const Text(
                                                  'No need for diagnosis..'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false); // Cancel
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Please Upload Image'),
                                              content: const Text(
                                                  'Please choose an image before diagnosis..'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false); // Cancel
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 167, 76, 153),
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text("Diagnose"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
