// import 'package:fit/home.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class glaf extends StatelessWidget {
//   const glaf({
//     Key? key,
//     required this.progressValue,
//   }) : super(key: key);

//   final double progressValue;

//   int touchedIndex = -1;

//   bool isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xffFAFAFA),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
//       padding: const EdgeInsets.only(top: 10, bottom: 10),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 8),
//                     child: const Text(
//                       'カロリー',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ),
//                   Container(
//                     height: 180,
//                     width: 180,
//                     child: SfRadialGauge(axes: <RadialAxis>[
//                       RadialAxis(
//                           minimum: 0,
//                           maximum: 100,
//                           showLabels: false,
//                           showTicks: false,
//                           radiusFactor: 0.8,
//                           axisLineStyle: const AxisLineStyle(
//                             thickness: 0.17,
//                             cornerStyle: CornerStyle.bothCurve,
//                             color: Color.fromARGB(30, 100, 100, 100),
//                             thicknessUnit: GaugeSizeUnit.factor,
//                           ),
//                           pointers: const <GaugePointer>[
//                             RangePointer(
//                                 value: 75,
//                                 cornerStyle: CornerStyle.bothCurve,
//                                 enableAnimation: true,
//                                 animationDuration: 1200,
//                                 animationType: AnimationType.ease,
//                                 sizeUnit: GaugeSizeUnit.factor,
//                                 gradient: SweepGradient(colors: <Color>[
//                                   Color.fromRGBO(253, 216, 53, 1),
//                                   Color.fromRGBO(255, 167, 38, 1),
//                                 ], stops: <double>[
//                                   0.25,
//                                   0.75
//                                 ]),
//                                 color: Color(0xFF00A8B5),
//                                 width: 0.22),
//                           ],
//                           annotations: <GaugeAnnotation>[
//                             GaugeAnnotation(
//                                 positionFactor: 0.1,
//                                 angle: 90,
//                                 widget: Text(
//                                   progressValue.toStringAsFixed(0) +
//                                       ' / 1000\n不足1000Kcal',
//                                   style: const TextStyle(fontSize: 10),
//                                   textAlign: TextAlign.center,
//                                 ))
//                           ])
//                     ]),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'PFCバランス',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   Container(
//                     height: 180,
//                     width: 180,
//                     child: Column(children: []),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             height: 33,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => BarChartSample1()));
//                     },
//                     child: Text('さらに表示 >'))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   BarChartGroupData makeGroupData(
//     int x,
//     double y, {
//     bool isTouched = false,
//     Color barColor = Colors.yellow,
//     double width = 10,
//     List<int> showTooltips = const [],
//   }) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color: barColor,
//           width: width,
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 20,
//             color: Colors.grey[300],
//           ),
//         ),
//       ],
//       showingTooltipIndicators: showTooltips,
//     );
//   }

//   List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, 10, isTouched: i == touchedIndex);
//           case 1:
//             return makeGroupData(1, 18, isTouched: i == touchedIndex);
//           case 2:
//             return makeGroupData(2, 20, isTouched: i == touchedIndex);
//           default:
//             return throw Error();
//         }
//       });

//   BarChartData mainBarData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         touchCallback: (FlTouchEvent event, barTouchResponse) {
//           setState(() {
//             if (!event.isInterestedForInteractions ||
//                 barTouchResponse == null ||
//                 barTouchResponse.spot == null) {
//               touchedIndex = -1;
//               return;
//             }
//             touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
//           });
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//             getTitlesWidget: getTitles,
//             reservedSize: 38,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: showingGroups(),
//       gridData: FlGridData(show: false),
//     );
//   }

//   Widget getTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 0:
//         text = const Text('タンパク質', style: style);
//         break;
//       case 1:
//         text = const Text('脂質', style: style);
//         break;
//       case 2:
//         text = const Text('炭水化物', style: style);
//         break;
//       default:
//         text = const Text('', style: style);
//         break;
//     }
//     return Padding(padding: const EdgeInsets.only(top: 16), child: text);
//   }

//   BarChartData randomData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         enabled: false,
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getTitles,
//             reservedSize: 38,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: List.generate(3, (i) {
//         switch (i) {
//           case 0:
//             return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 1:
//             return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           case 2:
//             return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
//                 barColor: widget.availableColors[
//                     Random().nextInt(widget.availableColors.length)]);
//           default:
//             return throw Error();
//         }
//       }),
//       gridData: FlGridData(show: false),
//     );
//   }

//   Future<dynamic> refreshState() async {
//     setState(() {});
//     await Future<dynamic>.delayed(
//         animDuration + const Duration(milliseconds: 50));
//     if (isPlaying) {
//       await refreshState();
//     }
//   }
// }
