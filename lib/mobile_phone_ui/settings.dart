import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/about_us.dart';
import 'package:skin_detection_system/mobile_phone_ui/editProfile.dart';
import 'package:skin_detection_system/mobile_phone_ui/login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> deleteUser(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        bool confirm = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Account'),
              content: const Text(
                  'Are you sure you want to delete your account? This action cannot be undone.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Cancel
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        );

        if (confirm) {
          await user.delete();
          print('User deleted successfully');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Account deleted successfully'),
          ));
        } else {
          print('Deletion canceled by user');
        }
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error deleting user: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting account: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              "Skin Disease",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Detection System",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.07,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
              title: "Edit Profile",
              icon: Icons.arrow_forward_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              screenWidth: screenWidth,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              title: "Delete Account",
              icon: Icons.delete,
              onTap: () {
                deleteUser(context);
              },
              screenWidth: screenWidth,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              title: "Sign Out",
              icon: Icons.logout_outlined,
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              screenWidth: screenWidth,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              title: "About Us",
              icon: Icons.info_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              },
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String title,
    required IconData icon,
    required Function onTap,
    required double screenWidth,
  }) {
    return Material(
      elevation: 1,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
