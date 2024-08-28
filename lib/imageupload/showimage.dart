// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class showImage extends StatefulWidget {
  String? uerId;

  showImage({super.key, this.uerId});

  @override
  State<showImage> createState() => _showImageState();
}

class _showImageState extends State<showImage> {
  Future<void> deleteAllImages() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(widget.uerId)
              .collection("images")
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        // Get the ID of each image document
        String imageId = doc.id;

        // Delete the image document using its ID
        await FirebaseFirestore.instance
            .collection("users")
            .doc(widget.uerId)
            .collection("images")
            .doc(imageId) // Specify the document ID here
            .delete();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Deleted Successfully",
          style: TextStyle(fontSize: 18),
        )));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        error.toString(),
        style: const TextStyle(fontSize: 18),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;
    final screenHieght = MediaQuery.of(this.context).size.height;

    // Calculate the actual padding based on the screen width
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Skin Disease",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.052,
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
                fontSize: screenWidth * 0.052,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(widget.uerId)
              .collection("images")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text("No image Uploaded"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = snapshot.data!.docs[index]["downloadURL"];
                  String date = snapshot.data!.docs[index]["Datetime"];
                  String name = snapshot.data!.docs[index]["Name"];
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Material(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  url,
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        date,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 115, 112, 112),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteAllImages();
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
