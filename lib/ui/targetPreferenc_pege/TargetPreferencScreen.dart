// Represents TargetPreferenceScreen class
import 'package:firebase_auth/firebase_auth.dart'
    as auth; //asをつけるのはUser.dartとfirebase_authにもUserクラスがありクラスが競合するから（authは意味はなく自分でつけれる）
import 'package:fit/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/FirebaseHelper.dart';
import '../home/HomeScreen.dart';

String proteinselectNumbar = '30';
String fatSelectNumbar = '10';
String carbosSelectNumbar = '60';
Map? pfcGram;

class TargetPreferenceScreen extends StatefulWidget {
  /// Creates the instance of TargetPreferenceScreen
  const TargetPreferenceScreen({Key? key}) : super(key: key);

  @override
  _TargetPreferenceState createState() => _TargetPreferenceState();
}

class _TargetPreferenceState extends State<TargetPreferenceScreen> {
  //値を保存用のUserインスタンス
  User currentUser = User();
  //値を出力用
  User? user;

  FireStoreUtils fireStoreUtils = FireStoreUtils();

  @override
  Widget build(BuildContext context) {
    final numbars = List<String>.generate(100, (index) => '$index');

    int allNumbar = int.parse(proteinselectNumbar) +
        int.parse(fatSelectNumbar) +
        int.parse(carbosSelectNumbar);
    String viewNumbar = allNumbar.toString();
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
                        onPressed: () {
                          pfcGram = caloriesToGrams(
                              currentUser.targetCalories,
                              proteinselectNumbar,
                              fatSelectNumbar,
                              carbosSelectNumbar);
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Material(
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
                                '$proteinselectNumbar%',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Material(
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
                                '$fatSelectNumbar%',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Material(
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
                                '$carbosSelectNumbar%',
                                style: const TextStyle(
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
                                proteinselectNumbar = numbars[index];
                                setState(() {});
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
                                fatSelectNumbar = numbars[index];
                                setState(() {});
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
                                carbosSelectNumbar = numbars[index];
                                setState(() {});
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
                              //TODO:リアルタイム数字変換
                              text: '$viewNumbar%',
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

    return ChangeNotifierProvider.value(
        value: currentUser,
        child: Consumer<User>(
          builder: (context, currentUser, _) {
            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: const Color(0xffFAFAFA),
                title: const Text(
                  '目標',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
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
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "未設定",
                                ),
                                onChanged: (text) {
                                  currentUser.weight = text;
                                  setState(() {});
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
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "未設定",
                                ),
                                onChanged: (text) {
                                  currentUser.targetWeight = text;
                                  setState(() {});
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
                                      hintText: "2500",
                                      hintStyle: TextStyle(color: Colors.blue),
                                    ),
                                    onChanged: (text) {
                                      currentUser.targetCalories = text;
                                      setState(() {});
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
                                  child: Text('$proteinselectNumbar%'),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                //三項演算子
                                (pfcGram?["proteinGram"] != null)
                                    ? Text(
                                        '${pfcGram!["proteinGram"]}',
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    : const Text(
                                        '81',
                                        style: TextStyle(fontSize: 15),
                                      ),

                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'g',
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
                                  child: Text('$fatSelectNumbar%'),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                (pfcGram?["fatGram"] != null)
                                    ? Text(
                                        '${pfcGram!["fatGram"]}',
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    : const Text(
                                        '81',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'g',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                                  child: Text('$carbosSelectNumbar%'),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                (pfcGram?["carboGram"] != null)
                                    ? Text(
                                        '${pfcGram!["carboGram"]}',
                                        style: const TextStyle(fontSize: 15),
                                      )
                                    : const Text(
                                        '81',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'g',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
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
                        onPressed: () async {
                          //TODOピッカーで選択した値をUserクラスに値を追加してfirestoreに追加
                          currentUser.targetProtein = proteinselectNumbar;
                          currentUser.targetFat = fatSelectNumbar;
                          currentUser.targetCarbo = carbosSelectNumbar;
                          //UserModelのuserIDメンバ変数に現在ログインしているユーザーのUIDを代入
                          currentUser.userID =
                              auth.FirebaseAuth.instance.currentUser!.uid;
                          //firestoreに入力した値を追加
                          await FireStoreUtils.updateCurrentUser(currentUser);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        ));
  }
}

//カロリーからグラムに変換
caloriesToGrams(calorie, p, f, c) {
  //一グラムあたりのカロリー
  int protein = 4;
  int fat = 9;
  int carbo = 4;
  Map pfcGrams = {};

  //少数に戻す
  num proteinRate = int.parse(p) / 100;
  //プロテインのカロリーを割り出す
  num proteinCalori = int.parse(calorie) * proteinRate;
  //カロリーからグラムを割り出す
  num proteinGram = proteinCalori / protein;

  num fatRate = int.parse(f) / 100;
  num fatCalori = int.parse(calorie) * fatRate;
  num fatGram = fatCalori / fat;

  num carboRate = int.parse(c) / 100;
  num carboCalori = int.parse(calorie) * carboRate;
  num carboGram = carboCalori / carbo;

//mapに値を追加する and .round()で四捨五入
  pfcGrams['proteinGram'] = proteinGram.round();
  pfcGrams["fatGram"] = fatGram.round();
  pfcGrams["carboGram"] = carboGram.round();

  return pfcGrams;
}
