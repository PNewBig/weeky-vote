import 'package:flutter/material.dart';

import '../widget/BuildForm.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/registerScreen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/Image/background.jpeg"),
                    fit: BoxFit.cover)),
            child: Form(
                child: Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildForm(text: "Firstname"),
                      BuildForm(text: "Lastname"),
                      BuildForm(text: "Email"),
                      BuildForm(text: "Password")
                    ]),
              ),
            ))));
  }
}
