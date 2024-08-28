import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/camera.dart';
import 'package:skin_detection_system/mobile_phone_ui/doctors.dart';
import 'package:skin_detection_system/mobile_phone_ui/home.dart';
import 'package:skin_detection_system/mobile_phone_ui/settings.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = [
    const HomePage(),
    const CameraPage(),
    const doctors_Page(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            // backgroundColor: Colors.transparent,
            selectedItemColor: const Color.fromARGB(255, 167, 76, 153),
            unselectedItemColor: const Color.fromARGB(255, 19, 19, 19),
            selectedFontSize: 15,
            unselectedFontSize: 15,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Scan"),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital),
                label: "Doctors",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
