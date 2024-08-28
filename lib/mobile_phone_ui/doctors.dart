// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection_system/database_service/database.dart';

// ignore: camel_case_types
class doctors_Page extends StatefulWidget {
  const doctors_Page({super.key});

  @override
  State<doctors_Page> createState() => _doctors_PageState();
}

// ignore: camel_case_types
class _doctors_PageState extends State<doctors_Page> {
  Stream? doctorsStream;
  String selectedCollege = "";

  getonload() async {
    doctorsStream = await DatabaseMethods().getdoctordetails();
    setState(() {});
  }

  @override
  void initState() {
    getonload();

    super.initState();
  }

  Widget allDoctorsDetails() {
    return StreamBuilder(
      stream: doctorsStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return const Center(
            child: Text('No data available'),
          );
        } else {
          // Filter data based on selected college
          List<DocumentSnapshot> filteredDocs = snapshot.data.docs.where((doc) {
            if (selectedCollege.isEmpty) {
              return true; // Return all data if no college is selected
            } else {
              return doc["Town"] == selectedCollege;
            }
          }).toList();

          return ListView.builder(
            itemCount: filteredDocs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = filteredDocs[index];

              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255), // Lighter shade
                      Color.fromARGB(
                          255, 230, 230, 230), // Slightly darker shade
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      // Action when tapped
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " ${ds["Provider"]} \n",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Town : ${ds["Town"]}\n",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 129, 126, 118),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Office Address: ${ds["Address"]}\n",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 129, 126, 118),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Phone Number: ${ds["Phone_Number"]}\n",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 129, 126, 118),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;

    // Calculate the actual padding based on the screen width
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Skin Disease",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Detection System",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              );
            } else {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Skin Disease",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Detection System",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              );
            }
          },
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Center(
        child: Container(
          width: 700,
          child: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: const Text(
                          "Healthcare Providers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: selectedCollege,
                        onChanged: (value) {
                          setState(() {
                            selectedCollege = value!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: "",
                            child: Text("Select Location"),
                          ),
                          DropdownMenuItem(
                            value: "Harare",
                            child: Text("Harare"),
                          ),
                          DropdownMenuItem(
                            value: "Gweru",
                            child: Text("Gweru"),
                          ),
                          DropdownMenuItem(
                            value: "Bulawayo",
                            child: Text("Bulawayo"),
                          ),
                          DropdownMenuItem(
                            value: "Mutare",
                            child: Text("Mutare"),
                          ),
                          DropdownMenuItem(
                            value: "Chinhoyi",
                            child: Text("Chinhoyi"),
                          ),
                          DropdownMenuItem(
                            value: "Karoi",
                            child: Text("Karoi"),
                          ),
                          DropdownMenuItem(
                            value: "Kadoma",
                            child: Text("Kadoma"),
                          ),
                          DropdownMenuItem(
                            value: "Victoria Falls",
                            child: Text("Victoria Falls"),
                          ),
                          DropdownMenuItem(
                            value: "Gwanda",
                            child: Text("Gwanda"),
                          ),
                          DropdownMenuItem(
                            value: "Ruwa",
                            child: Text("Ruwa"),
                          ),
                          DropdownMenuItem(
                            value: "Mutoko",
                            child: Text("Mutoko"),
                          ),
                          DropdownMenuItem(
                            value: "Zvishavane",
                            child: Text("Zvishavane"),
                          ),
                          DropdownMenuItem(
                            value: "Chitungwiza",
                            child: Text("Chitungwiza"),
                          ),
                          DropdownMenuItem(
                            value: "Bindura",
                            child: Text("Bindura"),
                          ),
                          DropdownMenuItem(
                            value: "Chegutu",
                            child: Text("Chegutu"),
                          ),
                          DropdownMenuItem(
                            value: "Norton",
                            child: Text("Norton"),
                          ),
                          DropdownMenuItem(
                            value: "Hwange",
                            child: Text("Hwange"),
                          ),
                          DropdownMenuItem(
                            value: "Zvishavane",
                            child: Text("Zvishavane"),
                          ),
                          DropdownMenuItem(
                            value: "Kariba",
                            child: Text("Kariba"),
                          ),
                          DropdownMenuItem(
                            value: "Rusape",
                            child: Text("Rusape"),
                          ),
                          DropdownMenuItem(
                            value: "Ngezi",
                            child: Text("Ngezi"),
                          ),
                          DropdownMenuItem(
                            value: "Kwekwe",
                            child: Text("Kwekwe"),
                          ),
                          DropdownMenuItem(
                            value: "Masvingo",
                            child: Text("Masvingo"),
                          ),
                          DropdownMenuItem(
                            value: "Marondera",
                            child: Text("Marondera"),
                          ),
                          DropdownMenuItem(
                            value: "Beitbridge",
                            child: Text("Beitbridge"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: allDoctorsDetails(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
