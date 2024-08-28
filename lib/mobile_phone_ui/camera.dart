import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skin_detection_system/imageupload/image_upload.dart';
import 'package:skin_detection_system/imageupload/imageuploadCamera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String? _userId;

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _showAlertDialog();
  }

  void _showAlertDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Instructions"),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                      "1. Clean the Camera: Wipe your camera gently with a soft cloth to remove any dirt or smudges."),
                  SizedBox(height: 5),
                  Text(
                      "2. Ensure Proper Lighting: Make sure the lighting is adequate. Avoid harsh shadows, direct sunlight, and blurry images."),
                  SizedBox(height: 5),
                  Text(
                      "3. Position the Device: Place the device approximately 5 cm away from the affected area. Ensure the affected area is centered in the camera view."),
                  SizedBox(height: 5),
                  Text(
                      "4. Take the Picture: Capture the image, making sure it is clear and focused on the affected area."),
                  SizedBox(height: 5),
                  Text(
                      "5. Upload the Image: Upload the image to the detection system. Ensure the image is less than 2MB."),
                  SizedBox(height: 5),
                  Text(
                      "6. Wait for Processing: Be patient while the image is being processed. This may take up to one minute."),
                  SizedBox(height: 5),
                  Text("Or Watch the Tutorial on YouTube:"),
                  SelectableText(
                    "https://youtu.be/q-MZ3bqc9pQ?si=TCrbcPUs7GfE12CJ",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;
    final screenHieght = MediaQuery.of(this.context).size.height;
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth * 0.02;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              "Skin Disease",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.052,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "Detection System",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.052,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHieght * 0.01),
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  "Scan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.052),
                ),
              ),
              SizedBox(height: screenHieght * 0.007),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  "assets/images/photo.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: screenHieght * 0.01),
              const Text(
                "Pick source: Upload from device or Take photo",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHieght * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageUpload(
                            userid: _userId,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.image,
                      size: screenWidth * 0.15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => imageupLoadCamera(
                            userid: _userId,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: screenWidth * 0.15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHieght * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
