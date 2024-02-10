class SignInModel {
  String? email, password;

  SignInModel({this.password, this.email});

  SignInModel copyWith({String? email, String? password}) {
    return SignInModel(
        email: email ?? this.email, password: password ?? this.password);
  }
}
