import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit/model/User.dart';

class FireStoreUtils {
  static Future<void> updateCurrentUser(User user) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc("4Ia3POTK9YKgT6u16lX6")
        .set(user.toJson());
  }

  static Future getCurrentUser() async {
    dynamic userDocument = FirebaseFirestore.instance
        .collection('users')
        .doc('4Ia3POTK9YKgT6u16lX6')
        .snapshots();
    return userDocument;
  }
}
