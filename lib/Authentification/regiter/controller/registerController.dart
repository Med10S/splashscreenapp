import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splashscreenapp/Authentification/regiter/exeptions/register_exeption.dart';
import 'package:splashscreenapp/Authentification/regiter/notifier/register_notifier.dart';

import '../../../utlis/widgets/popup_message.dart';

class RegisterController {
  final WidgetRef ref;

  RegisterController({required this.ref});

  Future<void> handleRegister() async {
    var state = ref.read(registerStateProvider);
    String name = state.userName ?? "";
    String email = state.email ?? "";
    String password = state.password ?? "";
    print("name : $name email : $email : password : $password");
    var context = Navigator.of(ref.context);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        credential.user?.updateDisplayName(name);
        toast(
            msg: '''An email has been send to verify your account
        Please open that email and confirm you identity''',
            color: Colors.black);
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      final ex = RegisterWithEmailAndPasswordFailure.code(e.code);
      toast(msg: ex.message, color: Colors.red);
    } catch (e) {
      print(e);
    }
  }
}
