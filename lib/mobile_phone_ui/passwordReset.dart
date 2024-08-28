// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email = '';
  final _formkey = GlobalKey<FormState>();

  TextEditingController usermailController = TextEditingController();

  @override
  void dispose() {
    usermailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: usermailController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Password Reset has been sent",
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255), fontSize: 18.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "User not foud",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 254, 254), fontSize: 18.0),
        )));
      }
    }
  }

  @override
  Widget build(Object context) {
    final screenWidth = MediaQuery.of(this.context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Skin Disease",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.050),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Detection System",
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.050),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Reset Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: usermailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 6, 6, 6)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 234, 205, 215),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = usermailController.text;
                        });
                        resetPassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 167, 76, 153),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 50)),
                    child: const Text(
                      "Reset",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
