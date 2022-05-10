import 'package:firebase_core/firebase_core.dart';
import 'package:fit/ui/auth/AuthScreen.dart';
import 'package:flutter/material.dart';

//現時点では目標設定画面
Future<void> main() async {
  //おまじない
  WidgetsFlutterBinding.ensureInitialized();
  //ファイアベースコアの初期化
  await Firebase.initializeApp();
  return runApp(MyApp());
}

/// Represents the MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthScreen(),
    );
  }
}
