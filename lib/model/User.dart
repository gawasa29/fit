class User {
  String weight;
  String targetWeight;
  String height;
  String everydayCalories;
  String protein;
  String fat;
  String carbo;

  User(
      {this.weight = "",
      this.targetWeight = "",
      this.height = "",
      this.everydayCalories = "",
      this.protein = "",
      this.fat = "",
      this.carbo = ""});

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'targetWeight': targetWeight,
      "height": height,
      "everydayCalories": everydayCalories,
      "protein": protein,
      "fat": fat,
      "carbo": carbo
    };
  }
}
