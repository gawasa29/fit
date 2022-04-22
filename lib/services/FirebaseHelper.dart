import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit/model/User.dart';

class FireStoreUtils {
  static Future<void> updateCurrentUser(User user) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set(user.toJson());
  }
}
