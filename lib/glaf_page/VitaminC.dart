import 'package:fit/glaf_page/GlafData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VitaminC extends StatelessWidget {
  const VitaminC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 9, bottom: 5),
              width: 340,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ビタミンC',
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "65",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            TextSpan(
                                text: ' / 109',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "不足", style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text: ' 129',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            TextSpan(text: 'g', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Container(
            width: 10,
            height: 360,
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
                            vitaminBBarData(),
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
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
      ],
    );
  }
}
