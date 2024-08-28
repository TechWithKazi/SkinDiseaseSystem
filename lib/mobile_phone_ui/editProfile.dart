import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:skin_detection_system/database_service/database.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userId = "";

  TextEditingController nameContoller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

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
    getUserData();
  }

  // Usage
  getUserData() async {
    String userId = _userId; // Replace with the actual UID

    Map<String, dynamic>? userData =
        await DatabaseMethods().getUserInfo(userId);

    if (userData != null) {
      if (mounted) {
        setState(() {
          nameContoller.text = userData['Name'];
          emailController.text = userData['E-mail'];
          phoneController.text = userData['Phone-Number'];
          locationController.text = userData["Location"];
          ageController.text = userData["Age"];
        });

        // Now you can use name, email, and phoneNumber variables as needed
      } else {
        // Handle the case where user data is not found
      }
    }
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                "Edit",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.052),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Profile",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameContoller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: "Name",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 234, 205, 215),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: screenHieght * 0.025,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 234, 205, 215),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: screenHieght * 0.025,
                  ),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter PhoneNumber";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: "Phone Number",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 234, 205, 215),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: screenHieght * 0.025,
                  ),
                  TextFormField(
                    controller: locationController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Location";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: "Location",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 234, 205, 215),
                        prefixIcon: Icon(
                          Icons.house,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: screenHieght * 0.025,
                  ),
                  TextFormField(
                    controller: ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Age";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: "Age",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 234, 205, 215),
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: screenHieght * 0.025,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Map<String, dynamic> userInfoMap = {
                          "id": _userId,
                          "Name": nameContoller.text,
                          "E-mail": emailController.text,
                          "Phone-Number": phoneController.text,
                          "Location": locationController.text,
                          "Age": ageController.text,
                        };
                        DatabaseMethods()
                            .updateUserDetail(_userId, userInfoMap);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "Update Succesfull",
                          style: TextStyle(fontSize: 18),
                        )));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 167, 76, 153),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 50)),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: screenWidth * 0.050,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
