import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splashscreenapp/Authentification/login/model/signInModel.dart';

part 'signIn_notifier.g.dart';

@riverpod
class SignInState extends _$SignInState {
  @override
  SignInModel build() {
    return SignInModel();
  }

  onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}
