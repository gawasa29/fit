import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class gawasasample extends StatefulWidget {
  const gawasasample({Key? key}) : super(key: key);

  @override
  State<gawasasample> createState() => _gawasasampleState();
}

class _gawasasampleState extends State<gawasasample> {
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
                child: const Text('Button'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                onPressed: () async {
                  Map<String, dynamic> demo = <String, dynamic>{
                    'お試しデータ': "test",
                  };
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc()
                      .set(demo);
                },
              ),
            ],
          ),
        ));
  }
}
