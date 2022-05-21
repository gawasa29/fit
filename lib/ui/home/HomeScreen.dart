import 'dart:async';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
//asをつけるのはUser.dartとfirebase_authにもUserクラスがありクラスが競合するから（authは意味はなく自分でつけれる）
import 'package:fit/ui/calendar/CalendarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/User.dart';
import '../add_page/AddPageScreen.dart';
import '../glaf_page/GlafScreen.dart';
import '../tab_page/DinnerTab.dart';
import '../tab_page/LunchTab.dart';
import '../tab_page/MorningTab.dart';
import '../tab_page/SnackTab.dart';

////////////////////////////////////////////////////////////////////////
//////////////////////////////HomeScreen画面//////////////////////////////////
///////////////////////////////////////////////////////////////////////
/// Represents HomeScreen class
class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;
  @override
  initState() {
    user = widget.user!;
    super.initState();
  }

  @override
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
        title: const Text(
          'Fitness App',
          style: TextStyle(color: Colors.black87),
        ),
        //設定画面未定なので放置
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const calendar(),
            glaf(progressValue: progressValue),

            //↓分けられへんかったからこのまま
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
                tabBarViewProperties: const TabBarViewProperties(
                  physics: NeverScrollableScrollPhysics(),
                ),
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
            child: const FaIcon(
              FontAwesomeIcons.mugHot,
              color: Colors.white,
            ),
            label: '間食',
            backgroundColor: const Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddPage()));
            },
          ),
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.solidMoon,
              color: Colors.white,
            ),
            label: '夕食',
            backgroundColor: const Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddPage()));
            },
          ),
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.solidSun,
              color: Colors.white,
            ),
            label: '昼食',
            backgroundColor: const Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddPage()));
            },
          ),
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.cloudSun,
              color: Colors.white,
            ),
            label: '朝食',
            backgroundColor: const Color.fromRGBO(253, 216, 53, 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddPage()));
            },
          ),
        ],
      ),
    );
  }
}
