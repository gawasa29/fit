import 'package:fit/add_page/AddFoodData.dart';
import 'package:fit/add_page/SerchFoodData.dart';
import 'package:flutter/material.dart';

class DinnerAdd extends StatelessWidget {
  const DinnerAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {},
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
