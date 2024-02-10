import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splashscreenapp/Authentification/regiter/model/regiterModel.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterState extends _$RegisterState {
  @override
  RegisterModel build() {
    return RegisterModel();
  }

  void onUserNameChange(String name) {
    state = state.copyWith(userName: name);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }
}
