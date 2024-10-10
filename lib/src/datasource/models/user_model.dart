class UserModel {
  final String name;
  final String email;
  final String pictureUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.pictureUrl,
  });

  // Convertir un JSON en UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: "${json['name']['first']} ${json['name']['last']}",
      email: json['email'],
      pictureUrl: json['picture']['thumbnail'],
    );
  }
}
