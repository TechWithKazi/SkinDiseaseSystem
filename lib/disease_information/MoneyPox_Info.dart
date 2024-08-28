import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/doctors.dart';

class MonekeyPoxInfo extends StatefulWidget {
  const MonekeyPoxInfo({Key? key}) : super(key: key);

  @override
  State<MonekeyPoxInfo> createState() => _diseasInfoState();
}

class _diseasInfoState extends State<MonekeyPoxInfo> {
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
                  "Monkeypox",
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
                "Monkeypox is a viral zoonotic disease caused by the monkeypox virus, a member of the Orthopoxvirus genus. It is similar to smallpox, though generally less severe. The virus is transmitted to humans from animals and can spread through human-to-human transmission.",
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
                '• Animal-to-Human Transmission: Contact with infected animals such as rodents and primates. This can occur through bites, scratches, or direct contact with the animals body fluid\n \n'
                '• Human-to-Human Transmission: Close contact with respiratory secretions, skin lesions of an infected person, or recently contaminated objects.\n \n'
                '• Consumption of Infected Animals: Eating undercooked meat or other animal products from infected animals \n \n'
                '•Direct Contact with Infected Materials: Handling contaminated bedding, clothing, or other materials. \n \n'
                '•Environmental Exposure: Being in regions where monkeypox is endemic, particularly in forested areas of Central and West Africa.',
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
                '• Fever: A sudden onset of fever, which is often high\n \n'
                '• Rash: Starts on the face and spreads to other parts of the body, turning into raised bumps and then vesicles (small fluid-filled blisters\n \n'
                '• Lymphadenopathy: Swollen lymph nodes, which is a distinguishing feature from smallpox \n \n'
                '• Muscle Aches and Headaches: General malaise and body aches \n \n'
                '•Chills and Sweats: Common flu-like sympt',
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
                '• Vaccination: The smallpox vaccine offers some protection against monkeypox. Newer vaccines specifically for monkeypox are also being developed.\n \n'
                '• Avoiding Contact with Infected Animals: Refrain from handling or consuming bush meat, especially in areas where monkeypox is endemie\n \n'
                '• Personal Protective Equipment (PPE): Use of gloves, masks, and other protective clothing when caring for infected individualson \n \n'
                '• Hygiene Practices: Frequent handwashing with soap and water, using alcohol-based hand sanitizers, and proper cleaning and disinfection of contaminated surfaces \n \n'
                '• Isolation: Isolating infected patients to prevent the spread of the virus',
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
                '• Antiviral Medications: Certain antiviral drugs, like Tecovirimat, are being investigated and used in some cases under compassionate use protocols  \n \n'
                '• Vaccinia Immune Globulin (VIG): Can be used in severe cases, particularly in immunocompromised individuals\n \n'
                '• Symptomatic Treatment: Includes pain management, fever reducers, and hydrationsize. \n \n'
                "• Hospital Care: In severe cases, hospitalization might be required for supportive care, including managing secondary infections and complications",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 130, 126, 126),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Container(
              //   decoration: const BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: Color.fromARGB(255, 167, 76, 153),
              //         width: 5,
              //       ),
              //     ),
              //   ),
              //   child: const Text(
              //     "Home Treatment",
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // const Text(
              //   '• Silicone Gel Sheets: Applying silicone gel sheets to the keloid site can help flatten and soften the scaridn  \n \n'
              //   '• Onion Extract: Some over-the-counter creams containing onion extract have been shown to reduce keloid size and appeage\n \n'
              //   '• Pressure Garments: Wearing pressure garments over the keloid site can hel. \n \n'
              //   "• Massage: Gentle massage of the keloid site with moisturizing cream may help improve blood circulation and reduce scar tissue builduside effects",
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Color.fromARGB(255, 130, 126, 126),
              //   ),
              // ),
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
