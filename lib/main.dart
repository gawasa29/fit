import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fit/AddPage.dart';
import 'package:fit/Billing.dart';
import 'package:fit/Calendar.dart';
import 'package:fit/Fooddata.dart';
import 'package:fit/Glaf.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  return runApp(MyApp());
}

/// Represents the MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  double progressValue = 0;
  double secondaryProgressValue = 0;
  // ignore: sort_constructors_first
  _DeterminatePageState() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer _timer) {
      setState(() {
        progressValue++;
        secondaryProgressValue = secondaryProgressValue + 2;
        if (progressValue == 100) {
          _timer.cancel();
        }
        if (secondaryProgressValue > 100) {
          secondaryProgressValue = 100;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.black87,
          ),
        ),
        title: const Text(
          'Fitness App',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            calendar(),
            glaf(progressValue: progressValue),
            Billing(),
            //分けられへんかったからこのまま
            Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 290,
              // labelColor: Colors.orange[300],
              child: ContainedTabBarView(
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const Text(
                    '朝食',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Text(
                    '昼食',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Text(
                    '夕食',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const Text(
                    '間食',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
                tabBarProperties: const TabBarProperties(
                  height: 35.0,
                  indicatorColor: Color.fromRGBO(255, 183, 77, 1),
                  indicatorWeight: 6.0,
                ),
                views: [
                  tabmenu(),
                  tabmenu(),
                  tabmenu(),
                  tabmenu(),
                ],
                onChange: (index) => print(index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.orange[400],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
      ),
    );
  }

  Container tabmenu() {
    return Container(
      child: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const ListTile(
                    leading: Text(
                      '合計',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    trailing: Text(
                      '1036kcal',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FoodData()));
                    },
                    child: const ListTile(
                      title: Text(
                        '白米',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle:
                          Text('100g', style: const TextStyle(fontSize: 13)),
                      trailing: Text('336kcal'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FoodData()));
                    },
                    child: const ListTile(
                      title: Text(
                        '白米',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle:
                          Text('100g', style: const TextStyle(fontSize: 13)),
                      trailing: Text('336kcal'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FoodData()));
                    },
                    child: const ListTile(
                      title: Text(
                        '白米',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle:
                          Text('100g', style: const TextStyle(fontSize: 13)),
                      trailing: Text('336kcal'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
