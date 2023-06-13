class SignUp {
  String? email;
  String? userName;
  String? lastName;
  String? password;

  SignUp({this.email, this.userName, this.lastName, this.password});

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": userName,
        "last_name": lastName,
        "password": password
      };
}
