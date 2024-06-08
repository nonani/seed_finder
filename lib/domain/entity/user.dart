class User {
  final String id;
  String name;
  String email;
  bool isSurveyCompleted;

  User({required this.id, required this.name, required this.email, required this.isSurveyCompleted});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isSurveyCompleted: json['isSurveyCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['isSurveyCompleted'] = isSurveyCompleted;
    return data;
  }

}