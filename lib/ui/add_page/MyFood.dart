import 'package:fit/home.dart';
import 'package:fit/main.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////
//////////////////////////////マイフード//////////////////////////////////
//////////////////////////////////////////////////////////////////////

class MyFood extends StatefulWidget {
  const MyFood({Key? key}) : super(key: key);

  @override
  State<MyFood> createState() => _MyFoodState();
}

class _MyFoodState extends State<MyFood> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffFAFAFA),
          title: const Text(
            '食品データ',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: const Icon(
                Icons.done,
                color: Colors.black87,
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.only(
                top: 5,
                left: 5,
                right: 5,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '名前',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 177,
                              height: 20,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(255, 167, 38, 1)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 7,
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'カロリー',
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'kcal',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 7,
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('タンパク質'),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 150,
                                  height: 20,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 167, 38, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'g',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 7,
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('脂肪'),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 150,
                                  height: 20,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 167, 38, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'g',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 7,
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('炭水化物'),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 150,
                                  height: 20,
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 167, 38, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'g',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 30,
                          top: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ー 糖質'),
                                Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 150,
                                        height: 20,
                                        child: TextField(
                                          textInputAction: TextInputAction.next,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      255, 167, 38, 1)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'g',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ー 食物繊維'),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 10, right: 20),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 150,
                                        height: 20,
                                        child: TextField(
                                          textInputAction: TextInputAction.next,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      255, 167, 38, 1)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'g',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: underlist(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.expand_more_outlined,
                          color: Colors.orange[400],
                        ),
                        onPressed: () {
                          setState(toggleShowText);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[400],
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Color.fromRGBO(255, 167, 38, 1),
                        )),
                  ),
                  child: Text(
                    '登録する',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFAFAFA),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),
            ),
          ]),
        ));
  }

  Container underlist() {
    return Container(
      child: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('カルシウム'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'mg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ビタミンA'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'μg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ビタミンC'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'μg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('鉄分'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'mg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('コレステロール'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'mg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ナトリウム'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'mg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('カリウム'),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(255, 167, 38, 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'mg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleShowText() {
    isVisible = !isVisible;
  }
}
