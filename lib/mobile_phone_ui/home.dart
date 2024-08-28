import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _userId;
  String? _email;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
        _email = user.email;
      });
    }
  }

  String getGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(Object context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;
    final screenHieght = MediaQuery.of(this.context).size.height;

    // Calculate the actual padding based on the screen width
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth * 0.02;
    final greeting = getGreeting();
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
                    fontSize: screenWidth * 0.050),
              ),
              SizedBox(
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
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: screenHieght * 0.009),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_3_rounded,
                            size: screenWidth * 0.17,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                greeting,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.055),
                              ),
                              Text(
                                _email!.replaceAll("@gmail.com", ""),
                                style: TextStyle(
                                    fontSize: screenWidth * 0.047,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          // i
                          //gnore: prefer_const_constructors
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                  this.context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: Icon(Icons.logout_outlined,
                                size: screenWidth * 0.15,
                                color: Color.fromARGB(255, 167, 76, 153)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Common Skin Disease's Found in Zimbabwe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.049,
                      ),
                    ),
                    Material(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.asset(
                                "assets/images/keloid.jpg",
                                height: 130,
                                width: 130,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keloid",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "A keloid is a growth of extra scar tissue.It occurs where the skin has healed after an injury.",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/Prurigo nodularis.jpg",
                                height: 150,
                                width: 130,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Prurigo nodularis ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "is a chronic skin disorder characterized by the presence of hard, extremely itchy bumps known as nodules",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.push(
                                //         this.context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const PrurigonodularisInfo()));
                                //   },
                                //   child: const Row(
                                //     children: [
                                //       Text("Read more >",
                                //           style: TextStyle(
                                //               color: Color.fromARGB(
                                //                   255, 167, 76, 153),
                                //               fontWeight: FontWeight.bold),
                                //           softWrap: true),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/Vitiligo.jpg",
                                height: 150,
                                width: 130,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vitiligo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "is a disease that causes loss of skin colour in patches.The discoloured areas usually get bigger with time",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.push(
                                //         this.context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const VitiligoInfo()));
                                //   },
                                //   child: const Row(
                                //     children: [
                                //       Text("Read more >",
                                //           style: TextStyle(
                                //               color: Color.fromARGB(
                                //                   255, 167, 76, 153),
                                //               fontWeight: FontWeight.bold),
                                //           softWrap: true),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/Paronychia.jpg",
                                height: 150,
                                width: 130,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Paronychia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "is a skin infection that occurs around the nails",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.push(
                                //         this.context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const ParonychiaInfo()));
                                //   },
                                //   child: const Row(
                                //     children: [
                                //       Text("Read more >",
                                //           style: TextStyle(
                                //               color: Color.fromARGB(
                                //                   255, 167, 76, 153),
                                //               fontWeight: FontWeight.bold),
                                //           softWrap: true),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/Tinea Corporis.jpg",
                                height: 150,
                                width: 130,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tinea Corporis",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: screenWidth * 0.049),
                                  ),
                                  const Text(
                                      "is a rash caused by a fungal infection. It's usually an itchy, circular rash with clearer skin in the middle",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 114, 114, 114),
                                          fontWeight: FontWeight.bold),
                                      softWrap: true),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //         this.context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const TineaCorporisInfo()));
                                  //   },
                                  //   child: const Row(
                                  //     children: [
                                  //       Text("Read more >",
                                  //           style: TextStyle(
                                  //               color: Color.fromARGB(
                                  //                   255, 167, 76, 153),
                                  //               fontWeight: FontWeight.bold),
                                  //           softWrap: true),
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/Tinea capitis.jpg",
                                height: 150,
                                width: 130,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tinea capitis",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "its a fungal infection that often affect child’s scalp and hair",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                                // GestureDetector(
                                //   onTap: () {
                                //     Navigator.push(
                                //         this.context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const TineacapitisInfo()));
                                //   },
                                //   child: const Row(
                                //     children: [
                                //       Text("Read more >",
                                //           style: TextStyle(
                                //               color: Color.fromARGB(
                                //                   255, 167, 76, 153),
                                //               fontWeight: FontWeight.bold),
                                //           softWrap: true),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ])),
        ));
  }
}
