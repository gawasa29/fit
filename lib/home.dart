import 'package:flutter/material.dart';

class exsample extends StatefulWidget {
  @override
  exsampleState createState() => exsampleState();
}

class exsampleState extends State<exsample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Test'),
            ),
            body: Container(
                padding: const EdgeInsets.all(20.0), child: intmenu())));
  }

  Widget intmenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 6.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'category 1',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'category 2',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'category 3',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'category 4',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
