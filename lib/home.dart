import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fit/Billing.dart';
import 'package:fit/Calendar.dart';
import 'package:fit/Fooddata.dart';
import 'package:fit/add_page/AddPage.dart';
import 'package:fit/glaf_page/Glaf.dart';
import 'package:fit/home.dart';
import 'package:fit/tab_page/DinnerTab.dart';
import 'package:fit/tab_page/LunchTab.dart';
import 'package:fit/tab_page/MorningTab.dart';
import 'package:fit/tab_page/SnackTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

/// Represents Home class
class Home extends StatefulWidget {
  /// Creates the instance of Home
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                views: const [
                  MorningTab(),
                  LunchTab(),
                  DinnerTab(),
                  SnackTab(),
                ],
                onChange: (index) => print(index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: Colors.orange[400],
        children: [
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.mugHot,
              color: Colors.white,
            ),
            label: '間食',
            backgroundColor: Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()));
            },
          ),
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.solidMoon,
              color: Colors.white,
            ),
            label: '夕食',
            backgroundColor: Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()));
            },
          ),
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.solidSun,
              color: Colors.white,
            ),
            label: '昼食',
            backgroundColor: Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()));
            },
          ),
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.cloudSun,
              color: Colors.white,
            ),
            label: '朝食',
            backgroundColor: Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()));
            },
          ),
        ],
      ),
    );
  }
}
