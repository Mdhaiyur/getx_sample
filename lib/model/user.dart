import 'dart:convert';


User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.user,
    this.token,
  });

  UserModel? user;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "token": token,
  };

  @override
  String toString() {
    return 'User{user: $user, token: $token}';
  }
}

class UserModel {
  UserModel({
    this.age,
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int? age;
  String? id;
  String? name;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    age: json["age"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "_id": id,
    "name": name,
    "email": email,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };

  @override
  String toString() {
    return 'UserModel{age: $age, id: $id, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}
