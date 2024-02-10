class RegisterModel {
  final String? userName, email, password, rePassword;

  RegisterModel({this.email, this.userName, this.password, this.rePassword});

  RegisterModel copyWith({String? userName, email, password, rePassword}) {
    return RegisterModel(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
