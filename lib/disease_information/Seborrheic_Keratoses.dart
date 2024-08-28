// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/doctors.dart';

class Seborrheic_Keratoses_Info extends StatefulWidget {
  const Seborrheic_Keratoses_Info({Key? key}) : super(key: key);

  @override
  State<Seborrheic_Keratoses_Info> createState() => _diseasInfoState();
}

class _diseasInfoState extends State<Seborrheic_Keratoses_Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Skin Disease",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Detection System",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Seborrheic Keratoses",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Seborrheic keratoses are common, benign skin growths that appear as wart-like, often pigmented lesions on the surface of the skin. They are usually brown, black, or light tan, have a waxy, scaly, slightly elevated appearance, and can vary in size. These growths are non-cancerous and are most commonly found in older adults.",
                style: TextStyle(
                  color: Color.fromARGB(255, 130, 126, 126),
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                  "Causes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                '• Genetic Factors: Family history plays a significant role, as these growths often run in families.\n \n'
                '• Aging: The likelihood of developing seborrheic keratoses increases with age, especially after the age of 50.\n \n'
                '• Sun Exposure: Prolonged exposure to ultraviolet (UV) light is thought to contribute to their development, although they can occur on areas not exposed to the sun. \n \n'
                '• Hormonal Changes:  Hormonal shifts, particularly during pregnancy or hormone replacement therapy, may trigger their appearance\n \n'
                '• Skin Friction: Repeated friction or irritation of the skin can promote the formation of these growths..',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                  "Symptoms",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                '• Appearance:  Flat or slightly elevated with a waxy, stuck-on appearance ,Color ranges from light tan to black , Shapes and sizes vary, often resembling warts or small plaques.\n \n'
                '• Texture: Typically rough and scaly, but can be smooth in some cases.\n \n'
                '• Location: Commonly found on the face, chest, shoulders, back, and other area \n \n'
                '• Itching or Irritation: Some lesions may itch or become irritated, especially if they are rubbed by clothing or scratches ',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                  "Prevention",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                '• Skin Protection: Use sunscreen and protective clothing to reduce UV exposure.\n \n'
                '• Regular Skin Checks: Regularly examine your skin and seek medical advice if new or changing growths appear. \n \n'
                '• Avoid Skin Irritation: Minimize friction or trauma to the skin.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
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
                  "Cure",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                '• Cryotherapy: Freezing the growth with liquid nitro.  \n \n'
                '• Curettage: Scraping the lesion off with a surgical instrument \n \n'
                '• Electrosurgery: Burning the growth off using electric current \n \n'
                "• Laser Therapy:  Using laser to remove the growth..",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Note : It's essential to consult with a dermatologist or healthcare professional for proper diagnosis and treatment options tailored to your specific situation",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const doctors_Page(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 167, 76, 153),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    child: Text(
                      "Find Clinic",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
