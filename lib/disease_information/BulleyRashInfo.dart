import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/doctors.dart';

class BulleyRashInfo extends StatefulWidget {
  const BulleyRashInfo({Key? key}) : super(key: key);

  @override
  State<BulleyRashInfo> createState() => _diseaseInfoState();
}

class _diseaseInfoState extends State<BulleyRashInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                  "Bulleye Rash",
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
                "A bullseye rash, also known as erythema migrans, is a distinctive skin lesion that often appears as a result of Lyme disease. It typically manifests as a red rash with a central clearing, resembling a target or bullseye. This rash is an early symptom of Lyme disease, which is caused by the bacterium Borrelia burgdorferi transmitted through the bite of an infected black-legged tick, also known as a deer tick.",
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
                '• Lyme Disease: The primary cause of a bullseye rash is Lyme disease, transmitted by the bite of an infected black-legged tick.\n \n'
                '• Allergic Reactions: Some allergic reactions to medications or other substances can cause skin rashes that resemble a bullseye.\n \n'
                '• Skin Infections: Other bacterial skin infections may occasionally produce a rash with a similar pattern. \n \n'
                '• Insect Bites: Certain insect bites can sometimes mimic the appearance of a bullseye rash. ',
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
                '• Appearance: Red, circular rash with a clear center, forming a bullseye pattern.\n \n'
                '• Location: Often appears at the site of the tick bite but can occur anywhere on the body.\n \n'
                '• Size: Usually expands over several days, sometimes reaching up to 12 inches (30 cm) in diameter. \n \n'
                '• Texture: Generally smooth and not itchy, but may feel warm to the touch. \n \n'
                '•Other Symptoms: Fever, chills, fatigue, headache, muscle and joint aches, swollen lymph nodes.',
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
                '• Avoid Tick-Infested Areas: Stay away from wooded, bushy, and grassy areas, especially during tick season (spring and summer).\n \n'
                '• Use Tick Repellents: Apply insect repellents containing DEET on skin and clothing, and permethrin on clothing.\n \n'
                '• Avoid Tanning Beds: UV light from tanning beds increases the risk of skin cancer. \n \n'
                '• Wear Protective Clothing: Wear long sleeves, long pants, and tuck pants into socks or boots. \n \n'
                '• Shower After Outdoor Activities: Showering within two hours of being outdoors can help remove unattached ticks',
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
                '• Antibiotics: Early-stage Lyme disease is typically treated with oral antibiotics such as doxycycline, amoxicillin, or cefuroxime axetil.  \n \n'
                '• Intravenous Antibiotics: For more severe cases, especially if the central nervous system is affected, intravenous antibiotics like ceftriaxone may be necessary.\n \n'
                '• Symptom Relief: Over-the-counter pain relievers, such as ibuprofen or acetaminophen, can help alleviate pain and discomfort\n \n'
                "• ChemotMonitoring: Follow-up care with a healthcare provider to ensure the infection is completely eradicated.",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(
                height: 5,
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
