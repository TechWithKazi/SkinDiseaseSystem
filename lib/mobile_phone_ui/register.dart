// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection_system/database_service/database.dart';
import 'package:skin_detection_system/mobile_phone_ui/bottomNav.dart';
import 'package:skin_detection_system/mobile_phone_ui/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String phonenumber = "";
  String age = "";
  String location = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailmailController = TextEditingController();
  TextEditingController passwordmailContoller = TextEditingController();
  TextEditingController confirmPasswordmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailmailController.dispose();
    passwordmailContoller.dispose();
    confirmPasswordmailController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  register() async {
    setState(() {
      _isLoading = true;
    });

    if (!isValidEmail(email)) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Please enter a valid email address",
        style: TextStyle(fontSize: 18),
      )));
      return;
    }

    if (password != null && password == confirmpassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String uid = userCredential.user!.uid;

        Map<String, dynamic> userInfoMap = {
          "id": uid,
          "Name": nameController.text,
          "E-mail": emailmailController.text,
          "Phone-Number": phoneNumberController.text,
          "Location": locationController.text,
          "Age": ageController.text,
        };

        await DatabaseMethods().addUserDetails(userInfoMap, uid);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 18),
        )));

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyBottomNavBar()));
      } on FirebaseException catch (e) {
        String errorMessage = '';
        if (e.code == "weak-password") {
          errorMessage = "Password Provided is weak";
        } else if (e.code == "email-already-in-use") {
          errorMessage = "E-mail already in use";
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          errorMessage,
          style: const TextStyle(fontSize: 18),
        )));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Passwords do not match",
        style: TextStyle(fontSize: 18),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "We're excited to have you. Sign up now!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter full Name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Full Name",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailmailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Email";
                            } else if (!isValidEmail(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Email",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: passwordmailContoller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Password";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Password",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: confirmPasswordmailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Confirm Password";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Confirm Password",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black,
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Phone Number";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Phone Number",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 10),
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
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Age",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Colors.black,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15),
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
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Location",
                            filled: true,
                            fillColor: Color.fromARGB(255, 234, 205, 215),
                            prefixIcon: Icon(
                              Icons.house_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = emailmailController.text;
                                      name = nameController.text;
                                      password = passwordmailContoller.text;
                                      confirmpassword =
                                          confirmPasswordmailController.text;
                                      phonenumber = phoneNumberController.text;
                                      location = locationController.text;
                                      age = ageController.text;
                                    });
                                    register();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 167, 76, 153),
                                  foregroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "Already have an Account? Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
