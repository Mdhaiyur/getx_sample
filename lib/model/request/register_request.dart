
class RegisterRequest{
  String? name;
  String? email;
  String? password;
  int? age;

  RegisterRequest({this.name, this.email, this.password, this.age});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'age': this.age,
    };
  }
}