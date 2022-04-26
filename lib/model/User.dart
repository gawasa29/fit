class User {
  String? weight;

  User({this.weight});

  // User.fromJson(Map<String, Object?> json)
  //     : this(
  //         weight: json['weight']! as int,
  //       );

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
    };
  }
}
