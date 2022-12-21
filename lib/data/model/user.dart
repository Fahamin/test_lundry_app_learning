class User {
  User({
    this.id,
    this.username,
    this.password,
    this.name,
  });

  String? id;
  String? username;
  String? password;
  String? name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "name": name,
      };
}
