import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import 'package:fit/add_page/AddFoodData.dart';
import 'package:fit/add_page/MyFood.dart';
import 'package:fit/add_page/SerchFoodData.dart';
import 'package:fit/home.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          '食事を追加する',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(1),
                  labelText: "検索する",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      )),
                ),
              ),
            ),
            Container(
                color: Colors.orange[100],
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: ElevatedButton(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 60,
                                  width: 88,
                                ),
                                Text('MYフード')
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              onPrimary: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyFood()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 60,
                                  width: 88,
                                ),
                                Text('MYレシピ')
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              onPrimary: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 60,
                                  width: 88,
                                ),
                                Text('バーコード')
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              onPrimary: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ))),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 5,
                  left: 10,
                ),
                child: const Text(
                  '履歴',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 400,
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
                views: [
                  tabmenu(),
                  tabmenu(),
                  tabmenu(),
                  tabmenu(),
                ],
                onChange: (index) => print(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container tabmenu() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddFoodData()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SerchFoodData()));
                        },
                        icon: Icon(
                          Icons.control_point_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: Icon(
                          Icons.control_point_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddFoodData()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '白米',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          subtitle:
                              Text('100g', style: TextStyle(fontSize: 13)),
                          trailing: Text('336kcal'),
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => exsample()));
                        },
                        icon: Icon(
                          Icons.control_point_outlined,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
