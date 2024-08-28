import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getdoctordetails() async {
    return await FirebaseFirestore.instance.collection("doctors").snapshots();
  }

  Future addImageDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("userimages")
        .doc(id)
        .set(userInfoMap);
  }

  Future updateUserDetail(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update(updateInfo);
  }

  Future<Map<String, dynamic>?> getUserInfo(String uid) async {
    try {
      // Get the document associated with the provided UID
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(
              'users') // Assuming 'users' is the collection where user data is stored
          .doc(uid) // Document ID is the UID
          .get();

      // Check if the document exists
      if (snapshot.exists) {
        // Return the user data
        return snapshot.data();
      } else {
        // Document doesn't exist
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
