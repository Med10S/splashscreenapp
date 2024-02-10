import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splashscreenapp/utlis/router/routes.dart';

import '../../../utlis/widgets/appTextField.dart';
import '../controller/loginController.dart';
import '../notifier/signIn_notifier.dart';

class LogInForm extends ConsumerStatefulWidget {
  const LogInForm({super.key});

  @override
  ConsumerState<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends ConsumerState<LogInForm> {
  late LogInController _controller;

  @override
  void initState() {
    _controller = LogInController(ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              appTextField(
                  func: (value) {
                    ref
                        .watch(signInStateProvider.notifier)
                        .onUserEmailChange(value);
                  },
                  valid: (value) {
                    if (value == null || value == "") {
                      return "Email Is required";
                    }
                    return null;
                  },
                  iconData: Icons.email,
                  hint: "Enter your Email",
                  label: "Email"),
              const SizedBox(
                height: 30,
              ),
              appTextField(
                  func: (value) {
                    ref
                        .watch(signInStateProvider.notifier)
                        .onUserPasswordChange(value);
                  },
                  valid: (value) {
                    if (value == null || value == "" || value.length < 6) {
                      return "Password invalid";
                    }
                    return null;
                  },
                  iconData: Icons.fingerprint,
                  hint: "Enter your Password",
                  label: "Password"),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "forget Password?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (key.currentState!.validate()) {
                    //login
                    _controller.handelLogIn();
                  } else {
                    print(key.currentState!.validate() == false);
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
                    child: Text("Login"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(decoration: TextDecoration.underline),
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
