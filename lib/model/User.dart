class User {
  String weight;

  User({this.weight = ""});

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
    };
  }
}
