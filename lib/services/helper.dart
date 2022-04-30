//TODO:書き方が汚すぎるのでいつか直す
class PFC {
  //シングルトンの記述
  PFC._();
  static final instance = PFC._();

  //一グラムあたりのカロリー
  int protein = 4;
  int fat = 9;
  int carbo = 4;

  //入力された各PFCグラムの値を計算して％を参照する関数
  totalCalorie(p, f, c) {
    //グラムからカロリーに変換
    int calorieProtein = int.parse(p) * protein;
    int calorieFat = int.parse(f) * fat;
    int calorieCarbo = int.parse(c) * carbo;

    int totalcalorie = calorieProtein + calorieFat + calorieCarbo;
    // ignore: avoid_print
    print(totalcalorie);
    return totalcalorie;
  }

  proteinPercent(p, f, c) {
    int calorieProtein = int.parse(p) * protein;
    int calorieFat = int.parse(f) * fat;
    int calorieCarbo = int.parse(c) * carbo;

    int totalcalorie = calorieProtein + calorieFat + calorieCarbo;
    calorieProtein = int.parse(p) * protein;
    num rate1 = calorieProtein / totalcalorie;
    //％を計算
    num percent1 = rate1 * 100;
    //四捨五入
    int proteinPercent = percent1.round();
    return proteinPercent;
  }

  fatPercent(p, f, c) {
    int calorieProtein = int.parse(p) * protein;
    int calorieFat = int.parse(f) * fat;
    int calorieCarbo = int.parse(c) * carbo;

    int totalcalorie = calorieProtein + calorieFat + calorieCarbo;

    num rate2 = calorieFat / totalcalorie;
    num percent2 = rate2 * 100;
    int fatPercent = percent2.round();
    return fatPercent;
  }

  carboPercent(p, f, c) {
    int calorieProtein = int.parse(p) * protein;
    int calorieFat = int.parse(f) * fat;
    int calorieCarbo = int.parse(c) * carbo;

    int totalcalorie = calorieProtein + calorieFat + calorieCarbo;
    num rate3 = calorieCarbo / totalcalorie;
    num percent3 = rate3 * 100;
    int carboPercent = percent3.round();
    return carboPercent;
  }
}
