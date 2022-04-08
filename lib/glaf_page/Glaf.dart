import 'dart:math';

import 'package:fit/glaf_page/AllGlaf.dart';
import 'package:fit/glaf_page/GlafData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class glaf extends StatefulWidget {
  const glaf({Key? key, required this.progressValue}) : super(key: key);
  final double progressValue;

  @override
  State<glaf> createState() => _glafState();
}

class _glafState extends State<glaf> {
  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: const Text(
                      'カロリー',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 180,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                          minimum: 0,
                          maximum: 1000,
                          showLabels: false,
                          showTicks: false,
                          radiusFactor: 0.8,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.17,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Color.fromARGB(30, 100, 100, 100),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: const <GaugePointer>[
                            RangePointer(
                                value: 450,
                                cornerStyle: CornerStyle.bothCurve,
                                enableAnimation: true,
                                animationDuration: 1200,
                                animationType: AnimationType.ease,
                                sizeUnit: GaugeSizeUnit.factor,
                                gradient: SweepGradient(colors: <Color>[
                                  Color.fromRGBO(253, 216, 53, 1),
                                  Color.fromRGBO(255, 167, 38, 1),
                                ], stops: <double>[
                                  0.25,
                                  0.75
                                ]),
                                color: Color(0xFF00A8B5),
                                width: 0.22),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              positionFactor: 0.1,
                              angle: 90,
                              widget: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "100",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                    TextSpan(
                                        text: ' / 1000\n不足500Kcal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                            )
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 9, bottom: 2),
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'タンパク質',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "6",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: ' / 109',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      width: 10,
                      height: 180,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Card(
                          elevation: 0,
                          color: const Color(0xffFAFAFA),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: BarChart(
                                      mainBarData(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "不足", style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: ' 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'g', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 175,
                    padding: const EdgeInsets.only(top: 10, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '脂質',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "100",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: ' / 1000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      width: 10,
                      height: 180,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Card(
                          elevation: 0,
                          color: const Color(0xffFAFAFA),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: BarChart(fatmainBarData()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "不足", style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: ' 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'g', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 175,
                    padding: const EdgeInsets.only(top: 10, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '炭水化物',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "100",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: ' / 1000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      width: 10,
                      height: 180,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Card(
                          elevation: 0,
                          color: const Color(0xffFAFAFA),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: BarChart(
                                      carbohydratemainBarData(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "不足", style: TextStyle(fontSize: 12)),
                              TextSpan(
                                  text: ' 500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: 'g', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 33,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllGlaf(
                                    progressValue: 1,
                                  )));
                    },
                    child: Text('さらに表示 >'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
