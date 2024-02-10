import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splashscreenapp/Authentification/regiter/notifier/register_notifier.dart';

import '../../../utlis/widgets/appTextField.dart';
import '../controller/registerController.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  late RegisterController _controller;

  @override
  void initState() {
    _controller = RegisterController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              appTextField(
                  func: (value) {
                    ref
                        .watch(registerStateProvider.notifier)
                        .onUserNameChange(value);
                  },
                  valid: (value) {
                    if (value == null || value == "") {
                      return "User Name Is required";
                    }
                    return null;
                  },
                  iconData: Icons.person,
                  label: "User Name",
                  hint: "Enter your Name"),
              const SizedBox(
                height: 30,
              ),
              appTextField(
                  func: (value) {
                    ref
                        .watch(registerStateProvider.notifier)
                        .onEmailChange(value);
                  },
                  valid: (value) {
                    if (value == null || value == "") {
                      return "Email Is required";
                    }
                    return null;
                  },
                  iconData: Icons.email,
                  label: "Email",
                  hint: "Enter your Email"),
              const SizedBox(
                height: 30,
              ),
              appTextField(
                  controller: passwordController,
                  func: (value) {
                    ref
                        .watch(registerStateProvider.notifier)
                        .onPasswordChange(value);
                  },
                  valid: (value) {
                    if (value == null || value == "" || value.length < 6) {
                      return "Password invalid";
                    }
                    return null;
                  },
                  iconData: Icons.fingerprint,
                  label: "Password",
                  hint: "Enter your Password"),
              const SizedBox(
                height: 30,
              ),
              appTextField(
                  func: (value) {
                    ref
                        .watch(registerStateProvider.notifier)
                        .onRePasswordChange(value);
                  },
                  valid: (value) {
                    if (value == null || value == "" || value.length < 6) {
                      return "RePassword invalid";
                    } else if (passwordController.value.text != value) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                  iconData: Icons.fingerprint,
                  label: "Confirm Password",
                  hint: "Confirm your Password"),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (key.currentState!.validate()) {
                    //.....
                    _controller.handleRegister();
                  } else {
                    key.currentState!.validate() == false;
                  }
                },
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1)),
                      ]),
                  child: const Center(
                    child: Text("Register"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
