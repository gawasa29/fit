import 'package:flutter/material.dart';

pushReplacement(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    new MaterialPageRoute(builder: (context) => destination),
  );
}

push(BuildContext context, Widget destination) {
  Navigator.of(context).push(
    new MaterialPageRoute(builder: (context) => destination),
  );
}

pushAndRemoveUntil(BuildContext context, Widget destination, bool predict) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => destination),
      (Route<dynamic> route) => predict);
}

Widget topIconRow(BuildContext context, {VoidCallback? onBackPressed}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      Image.asset(
        'assets/images/logoIcon.png',
        height: 68,
        width: 68,
      ),
      Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: false,
        child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => null),
      ),
    ],
  );
}
