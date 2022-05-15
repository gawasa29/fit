import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit/model/User.dart';

class FireStoreUtils {
  static Future<void> updateCurrentUser(User user) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(user.userID)
        .set(user.toJson());
  }

  static Future<User?> getCurrentUser() async {
    DocumentSnapshot<Map<String, dynamic>> userDocument =
        await FirebaseFirestore.instance.collection('users').doc("uid").get();
    if (userDocument.exists) {
      return User.fromJson(userDocument.data() ?? {});
    } else {
      return null;
    }
  }
}
