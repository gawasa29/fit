import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit/constans.dart';
import 'package:fit/model/Food.dart';
import 'package:fit/model/User.dart';

class FireStoreUtils {
  //userの処理たち
  static Future<void> updateCurrentUser(User user) async {
    return await FirebaseFirestore.instance
        .collection(USERS)
        .doc(user.userID)
        .set(user.toJson());
  }

  static Future<User?> getCurrentUser(User user) async {
    DocumentSnapshot<Map<String, dynamic>> userDocument =
        await FirebaseFirestore.instance
            .collection(USERS)
            .doc(user.userID)
            .get();
    if (userDocument.exists) {
      return User.fromJson(userDocument.data() ?? {});
    } else {
      return null;
    }
  }

//foodoの処理たち
  static Future<void> addFood(Food food) async {
    return await FirebaseFirestore.instance
        .collection(FOOD)
        .doc()
        .set(food.toJson());
  }
}
