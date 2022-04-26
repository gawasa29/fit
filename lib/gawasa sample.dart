import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit/model/User.dart';
import 'package:fit/services/FirebaseHelper.dart';
import 'package:flutter/material.dart';

class gawasasample extends StatefulWidget {
  const gawasasample({Key? key}) : super(key: key);

  @override
  State<gawasasample> createState() => _gawasasampleState();
}

class _gawasasampleState extends State<gawasasample> {
  @override
  User user = User();
  FireStoreUtils fireStoreUtils = FireStoreUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Text("このページはgawasaのお試しようページです"),
              ElevatedButton(
                child: const Text('体重変数に値を追加ボタン'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  user.weight = 1000.toString();
                },
              ),
              ElevatedButton(
                child: const Text('値をfirebaseに追加'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                onPressed: () async {
                  await FireStoreUtils.updateCurrentUser(user);
                },
              ),
              StreamBuilder<DocumentSnapshot>(
                  stream: fireStoreUtils.usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!['weight'].toString());
                    } else {
                      return Container();
                    }
                  })
            ],
          ),
        ));
  }
}
