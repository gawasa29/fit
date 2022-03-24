import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
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
            Container(
              color: const Color(0xffFAFAFA),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    '2022年 3月 21日',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'カロリー',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.8,
                              axisLineStyle: const AxisLineStyle(
                                thickness: 0.2,
                                cornerStyle: CornerStyle.bothCurve,
                                color: Color.fromARGB(30, 0, 169, 181),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: progressValue,
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 0.2,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    enableAnimation: true,
                                    animationDuration: 100,
                                    animationType: AnimationType.linear)
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    positionFactor: 0.1,
                                    angle: 90,
                                    widget: Text(
                                      progressValue.toStringAsFixed(0) +
                                          ' / 1000\n不足1000Kcal',
                                      style: const TextStyle(fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ))
                              ])
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PFCバランス',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.8,
                              // ignore: prefer_const_constructors
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.2,
                                cornerStyle: CornerStyle.bothCurve,
                                color: const Color.fromARGB(30, 0, 169, 181),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: progressValue,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 0.2,
                                  sizeUnit: GaugeSizeUnit.factor,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    positionFactor: 0.1,
                                    angle: 90,
                                    widget: Text(
                                      progressValue.toStringAsFixed(0) +
                                          ' / 1000',
                                      style: const TextStyle(fontSize: 10),
                                    ))
                              ])
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              color: const Color(0xffFAFAFA),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'バーコードで検索機能を追加！',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      'Fitness GOLDに登録してバーコードで楽々検索しましょう！',
                      style: TextStyle(color: Colors.grey[700], fontSize: 11),
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Fitness GOLDに登録',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[300],
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 300,
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
                tabBarProperties: TabBarProperties(
                  height: 35.0,
                  indicatorColor: Colors.orange[300],
                  indicatorWeight: 6.0,
                ),
                views: [
                  Container(
                    child: ListView(
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const ListTile(
                          leading: Text(
                            '合計',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Text(
                            '336kcal',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const ListTile(
                          leading: Text(
                            '合計',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Text(
                            '336kcal',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const ListTile(
                          leading: Text(
                            '合計',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Text(
                            '336kcal',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle: Text('100g',
                              style: const TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const ListTile(
                          leading: Text(
                            '合計',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          trailing: const Text(
                            '336kcal',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
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
        backgroundColor: Colors.orange[300],
        onPressed: () {},
      ),
    );
  }
}
