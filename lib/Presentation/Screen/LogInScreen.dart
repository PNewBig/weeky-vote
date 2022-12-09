import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Screen/RegisterScreen.dart';

import '../widget/BuildForm.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/Image/background.jpeg"),
                fit: BoxFit.cover)),
        child: Form(
          child: Positioned(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildForm(text: "Email"),
                  BuildForm(text: "Password")
                ]),
          ),
        ),
      ),
    );
  }
}
