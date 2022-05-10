//TODO:書き方が汚すぎるのでいつか直す
class PFC {
  //シングルトンの記述
  PFC._();
  static final instance = PFC._();

  //一グラムあたりのカロリー
  int protein = 4;
  int fat = 9;
  int carbo = 4;

  caloriesTograms(calorie, p, f, c) {
    Map pfcGrams = {};

    //少数に戻す
    num proteinRate = int.parse(p) / 100;
    //プロテインのカロリーを割り出す
    num proteinCalori = int.parse(calorie) * proteinRate;
    //カロリーからグラムを割り出す
    num proteinGram = proteinCalori / protein;
    print("$calorie,kcal中の$p％のプロテインは$proteinGram,gです");

    num fatRate = int.parse(f) / 100;
    num fatCalori = int.parse(calorie) * fatRate;
    num fatGram = fatCalori / fat;
    print("$calorie,kcal中の$f％の脂質は$fatGram,gです");

    num carboRate = int.parse(c) / 100;
    num carboCalori = int.parse(calorie) * carboRate;
    num carboGram = carboCalori / carbo;
    print("$calorie,kcal中の$c％の炭水化物は$carboGram,gです");

//mapに値を追加する and .round()で四捨五入
    pfcGrams['proteinGram'] = proteinGram.round();
    pfcGrams["fatGram"] = fatGram.round();
    pfcGrams["carboGram"] = carboGram.round();
    print(pfcGrams);

    return pfcGrams;
  }
}

void checkType(value) {
  print(value);
  if (value is String) {
    print('型はStringです');
  } else if (value is int) {
    print("型はintです");
  } else if (value is double) {
    print("型はdoubleです");
  } else if (value is bool) {
    print("型はboolです");
  } else if (value is DateTime) {
    print("型はDateTimeです");
  } else if (value is List) {
    print("型はListです");
  } else if (value is Map) {
    print("型はMapです");
  } else {
    print("ここでは定義されていない型です");
  }
}
