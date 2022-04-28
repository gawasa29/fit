import 'package:firebase_core/firebase_core.dart';
import 'package:fit/gawasa%20sample.dart';
import 'package:fit/homeScreen.dart';
import 'package:fit/model/User.dart';
import 'package:fit/services/FirebaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String selectNumbar = '20';
String selectNumbar2 = '50';
String selectNumbar3 = '50';
//現時点では目標設定画面
Future<void> main() async {
  //おまじない
  WidgetsFlutterBinding.ensureInitialized();
  //ファイアベースコアの初期化
  await Firebase.initializeApp();
  return runApp(MyApp());
}

/// Represents the MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final numbars = List<String>.generate(100, (index) => '$index');
    User user = User();
    void initState() {
      // Pickerで選択したアイテムが代入される予定

      super.initState();
    }

    void _cupertinoPicker() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            final Size size = MediaQuery.of(context).size;
            return Container(
              height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text('閉じる'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: const Text('決定'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Material(
                              color: Colors.white,
                              child: Text(
                                'タンパク質',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                            Material(
                              color: Colors.white,
                              child: Text(
                                '0g',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Material(
                              color: Colors.white,
                              child: Text(
                                '脂質',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                            Material(
                              color: Colors.white,
                              child: Text(
                                '50g',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Material(
                              color: Colors.white,
                              child: Text(
                                '炭水化物',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                            Material(
                              color: Colors.white,
                              child: Text(
                                '50g',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 180,
                    child: Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 35,
                              scrollController:
                                  FixedExtentScrollController(initialItem: 50),
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectNumbar = numbars[index];
                                });
                              },
                              children: numbars
                                  .map((numbar) => Text(numbar))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 35,
                              scrollController:
                                  FixedExtentScrollController(initialItem: 50),
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectNumbar2 = numbars[index];
                                });
                              },
                              children: numbars
                                  .map((numbar) => Text(numbar))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 35,
                              scrollController:
                                  FixedExtentScrollController(initialItem: 50),
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  selectNumbar3 = numbars[index];
                                });
                              },
                              children: numbars
                                  .map((numbar) => Text(numbar))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "合計",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          TextSpan(
                              text: ' 100%',
                              style: TextStyle(
                                  color: Colors.orange[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Material(
                      color: Colors.white,
                      child: Text(
                        'PFC比率の割合は足して100％になるように設定してください',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFAFAFA),
        title: const Text(
          '目標',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
                '目標',
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '現在体重',
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: TextField(
                        textAlign: TextAlign.right,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "未設定",
                        ),
                        onChanged: (value) {
                          user.weight = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'kg',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '目標体重',
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      child: TextField(
                        textAlign: TextAlign.right,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "未設定",
                        ),
                        onSubmitted: (value) {
                          user.targetWeight = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'kg',
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                '栄養素の目標設定',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '目標カロリー',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                          child: TextField(
                            textAlign: TextAlign.right,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "2900",
                              hintStyle: TextStyle(color: Colors.blue),
                            ),
                            onSubmitted: (value) {
                              user.everydayCalories = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'kcal',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'タンパク質',
                    ),
                    // 青い文字押したらピッカー表示（どこ押しても可能)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _cupertinoPicker();
                          },
                          child: Text('$selectNumbar%'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          '81',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'kg',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '脂質',
                    ),
                    // 青い文字押したらピッカー表示（どこ押しても可能)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _cupertinoPicker();
                          },
                          child: Text('$selectNumbar2%'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          '81',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'kg',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '炭水化物',
                    ),
                    // 青い文字押したらピッカー表示（どこ押しても可能)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _cupertinoPicker();
                          },
                          child: Text('$selectNumbar3%'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          '81',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'kg',
                        ),
                      ],
                    ),
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
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Color.fromRGBO(255, 167, 38, 1),
                      )),
                ),
                child: const Text(
                  '登録する',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFAFAFA),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('gawasa sample'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const gawasasample()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('値をfirebaseに追加ボタン'),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange, onPrimary: Colors.white),
            onPressed: () async {
              await FireStoreUtils.updateCurrentUser(user);
            },
          ),
          ElevatedButton(
            child: const Text('PFCbotan'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              print(selectNumbar);
              print(selectNumbar2);
              print(selectNumbar3);
            },
          ),
        ]),
      ),
    );
  }
}
