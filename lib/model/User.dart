class User {
  String weight;
  String targetWeight;
  String height;
  String everydayCalories;

  User({
    this.weight = "",
    this.targetWeight = "",
    this.height = "",
    this.everydayCalories = "",
  });

  //Firebaseからデータを取得する際の変換処理
  User.fromJson(Map<String, dynamic> json)
      : this(
          weight: json['weight'],
          targetWeight: json['targetWeight'],
          height: json['height'],
          everydayCalories: json['everydayCalories'],
        );

  //DartのオブジェクトからFirebaseへ渡す際の変換処理
  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'targetWeight': targetWeight,
      "height": height,
      "everydayCalories": everydayCalories,
    };
  }
}
