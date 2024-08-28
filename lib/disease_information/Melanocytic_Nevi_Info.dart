import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/doctors.dart';

class MelanocyticNeviInfo extends StatefulWidget {
  const MelanocyticNeviInfo({super.key});

  @override
  State<MelanocyticNeviInfo> createState() => _MelanocyticNeviInfoState();
}

class _MelanocyticNeviInfoState extends State<MelanocyticNeviInfo> {
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
                        fontSize: constraints.maxWidth * 0.05),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Text(
                    "Detection System",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxWidth * 0.05),
                  ),
                ),
              ],
            );
          },
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
              _buildSectionTitle("Melanocytic nevi"),
              const SizedBox(height: 5),
              _buildSectionContent(
                  "Melanocytic nevi, commonly known as moles, are benign proliferations of melanocytes, the pigment-producing cells in the skin. They can appear anywhere on the body, varying in size, shape, and color. Moles are usually brown, black, or flesh-colored and can be flat or raised"),
              const SizedBox(height: 5),
              _buildSectionTitle("Causes"),
              _buildSectionContent(
                  '• Genetic Factors: A predisposition to developing moles can be inherited. Family history plays a significant role in the number and type of moles a person might develop.\n \n'
                  '• Sun Exposure: Ultraviolet (UV) radiation from the sun or tanning beds can trigger the formation of new moles and darken existing ones\n \n'
                  '• Hormonal Changes: Hormonal fluctuations during puberty, pregnancy, and menopause can affect melanocyte activity, leading to the development of new moles or changes in existing ones. \n \n'
                  '• Immune System Factors: An individuals immune response can influence mole development and changes. \n \n'
                  '• Age: Moles can develop over time, especially during childhood and adolescence. Some moles can fade or disappear with age..'),
              const SizedBox(height: 5),
              _buildSectionTitle("Symptoms"),
              _buildSectionContent(
                  '• Appearance of New Moles: Especially after childhood..\n \n'
                  '• Changes in Existing Moles: This includes changes in size, shape, color, or texture..\n \n'
                  '• Itching or Bleeding: Though not common, some moles might become itchy or bleed if irritated. \n \n'
                  '• Asymmetry: One half of the mole does not match the other half. \n \n'
                  '• Border Irregularity: Edges are ragged, notched, or blurred.'),
              const SizedBox(height: 5),
              _buildSectionTitle("Prevention"),
              _buildSectionContent(
                  '• Sun Protection: Use broad-spectrum sunscreen with an SPF of 30 or higher, wear protective clothing, and seek shade during peak sun hours.\n \n'
                  '• Avoid Tanning Beds: UV radiation from tanning beds can increase the risk of developing moles and skin cancer\n \n'
                  '• Regular Skin Checks: Monitor your skin for any new moles or changes to existing moles. Self-exams and professional skin exams can help detect issues early. \n \n'
                  '• Healthy Lifestyle: Maintain a healthy diet and lifestyle to support overall skin health.'),
              const SizedBox(height: 5),
              _buildSectionTitle("Cure"),
              _buildSectionContent(
                  '• Observation: Most moles do not require treatment and can be monitored for any changes..  \n \n'
                  '• Surgical Removal: If a mole is suspicious or causes cosmetic concerns, it can be removed surgically. Methods include excision with stitches, shave removal, or laser treatment.\n \n'
                  '• Biopsy: If a mole shows signs of malignancy, a dermatologist might perform a biopsy to check for skin cancer.\n \n'
                  "• Topical Treatments: Rarely used, but some moles might be treated with topical medications if deemed necessary by a healthcare provider."),
              const SizedBox(height: 10),
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

  Widget _buildSectionTitle(String title) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 167, 76, 153), width: 5))),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        color: Color.fromARGB(255, 130, 126, 126),
        fontSize: 18,
      ),
    );
  }
}
