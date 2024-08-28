import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/doctors.dart';

class MelanomaInfo extends StatefulWidget {
  const MelanomaInfo({Key? key}) : super(key: key);

  @override
  State<MelanomaInfo> createState() => _diseaseInfoState();
}

class _diseaseInfoState extends State<MelanomaInfo> {
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
                  "Melanoma",
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
                "Melanoma is a type of skin cancer that originates in the melanocytes, the cells responsible for producing melanin, the pigment that gives skin its color. It is the most serious type of skin cancer because it is more likely to spread to other parts of the body if not detected and treated early.",
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
                '• Ultraviolet (UV) Radiation: Prolonged exposure to UV radiation from the sun or tanning beds is the primary cause of melanoma. UV radiation damages the DNA in skin cells, which can lead to cancer.\n \n'
                '• Genetic Factors: A family history of melanoma increases the risk of developing the disease. Specific genetic mutations, such as those in the BRAF, NRAS, and CDKN2A genes, are associated with a higher risk.\n \n'
                '• Fair Skin: Individuals with fair skin, light hair, and light eyes are at greater risk because they have less melanin, which provides some protection against UV radiat \n \n'
                '• Moles: Having a large number of moles, especially atypical or dysplastic nevi (unusual-looking moles), increases the risk of melan \n \n'
                '• Weakened Immune System: People with weakened immune systems, such as those who have had organ transplants or are on immunosuppressive drugs, have a higher risk of developing melanoma.',
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
                '• Changes in Existing Moles: This includes changes in size, shape, color, or texture of a mole.\n \n'
                '• New Pigmented or Unusual-Looking Growths: Appearance of new spots or sores that do not heal.\n \n'
                '• Lymphadenopathy: Swollen lymph nodes, which is a distinguishing feature from smallpox \n \n'
                '• Color Variation: The color is not the same all over and may include shades of brown or black, sometimes with patches of pink, red, white, or blues \n \n'
                '• Evolving: Any change in size, shape, color, elevation, or another trait, or any new symptom such as bleeding, itching, or crusting',
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
                '• Avoid Excessive Sun Exposure: Seek shade, especially during midday hours when the suns rays are strongest.\n \n'
                '• Use Sunscreen: Apply a broad-spectrum sunscreen with an SPF of at least 30, even on cloudy days. Reapply every two hours, or after swimming or sweating.mie\n \n'
                '•Avoid Tanning Beds: UV light from tanning beds increases the risk of skin cancer. \n \n'
                '• Hygiene Practices: Frequent handwashing with soap and water, using alcohol-based hand sanitizers, and proper cleaning and disinfection of contaminated surfaces \n \n'
                '• Regular Skin Checks: Perform regular self-examinations to check for new or changing moles, and see a dermatologist for annual skin exams',
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
                '• Surgical Removal: The primary treatment for melanoma is surgical removal of the tumor and some surrounding healthy tissue. Early-stage melanomas can often be completely removed with surgery.  \n \n'
                '• Immunotherapy: Uses the bodys immune system to fight cancer. Drugs like pembrolizumab (Keytruda) and nivolumab (Opdivo) are common.\n \n'
                '• Radiation Therapy: Uses high-energy rays to kill cancer cells, often used when melanoma has spread or cannot be removed surgically \n \n'
                "• Chemotherapy: Uses drugs to kill cancer cells, usually when melanoma has spread to other parts of the body. While not as commonly used now due to advances in other treatments, it can still be part of the treatment plan for some patients.",
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
