import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class glaf extends StatelessWidget {
  const glaf({
    Key? key,
    required this.progressValue,
  }) : super(key: key);

  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        thickness: 0.17,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Color.fromARGB(30, 100, 100, 100),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: const <GaugePointer>[
                        RangePointer(
                            value: 75,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                              progressValue.toStringAsFixed(1) + ' / 1000',
                              style: const TextStyle(fontSize: 10),
                            ))
                      ])
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
