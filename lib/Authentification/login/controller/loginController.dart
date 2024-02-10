import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splashscreenapp/global.dart';
import 'package:splashscreenapp/utlis/constants.dart';
import 'package:splashscreenapp/utlis/widgets/popup_message.dart';

import '../../regiter/exeptions/register_exeption.dart';
import '../notifier/signIn_notifier.dart';

class LogInController {
  final WidgetRef ref;

  LogInController(this.ref);

  Future<void> handelLogIn() async {
    var state = ref.read(signInStateProvider);

    String email = state.email ?? "";
    String password = state.password ?? "";
    // print("email $email password $password");
    var context = Navigator.of(ref.context);
    try {
      final credential = await SignInRepo.firebaseLogin(email, password);
      if (!credential.user!.emailVerified) {
        toast(
            msg: "You must Verify your email address first !",
            color: Colors.white);
        return;
      }
      Global.storageService
          .setString(AppConst.User_Token, credential.user!.uid);
      print("user uid : ${credential.user!.uid}");
      context.pushNamed("/");
    } on FirebaseAuthException catch (e) {
      print(e.code);
      final ex = RegisterWithEmailAndPasswordFailure.code(e.code);
      toast(color: Colors.red, msg: ex.message);
    } catch (e) {}
  }
}

class SignInRepo {
  static Future<UserCredential> firebaseLogin(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}
