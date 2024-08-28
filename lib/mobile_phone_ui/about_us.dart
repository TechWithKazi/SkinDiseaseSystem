import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Skin Disease",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth * 0.05,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    "Detection System",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth * 0.05,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 167, 76, 153),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'We are a passionate group of students dedicated to harnessing the power of technology to make a positive impact on healthcare. Our team is currently focused on developing an innovative skin disease detection system aimed at providing early diagnosis and improved patient outcomes.\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 167, 76, 153),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Our Mission",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Our mission is to leverage advanced technology and machine learning to create a reliable and user-friendly tool that can assist both healthcare professionals and individuals in identifying skin diseases accurately and efficiently. We believe that early detection is crucial in the treatment and management of skin conditions, and our system aims to facilitate this process.\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 167, 76, 153),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Who We Are",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Our team consists of enthusiastic IT students with a shared interest in applying our technical skills to solve real-world problems. By combining our expertise in software development, data analysis, and machine learning, we are equipped to tackle complex challenges and develop a comprehensive solution.\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 167, 76, 153),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "What We Do",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Our project involves the use of state-of-the-art machine learning algorithms and image processing techniques to analyze skin images and detect potential diseases. By providing an accessible and reliable detection system, we aim to empower users with the information they need to seek timely medical advice and treatment.\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 167, 76, 153),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Our Vision",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'We envision a future where technology plays a pivotal role in healthcare, reducing the burden on medical professionals and making high-quality diagnostic tools available to everyone. Our skin disease detection system is a step towards this vision, aiming to make skin health monitoring easier and more accessible for people around the world.\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 167, 76, 153),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Join Us",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'As a student-led initiative, we are always open to collaboration, feedback, and support from the community. If you share our passion for technology and healthcare, we invite you to join us on this exciting journey. Together, we can make a difference in the lives of many by improving access to early skin disease detection.Contant Us\n'
                '• rikonda16@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
