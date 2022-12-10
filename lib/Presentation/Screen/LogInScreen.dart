import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Screen/HomeScreen.dart';
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildForm(text: "Email"),
            BuildForm(text: "Password"),
            SizedBox(
              height: 100,
            ),
            Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ElevatedButton(
                    child: Text("Sig in"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    })),
            Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.5)),
                    child: Text("Sig Up"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    })),
          ]),
        ),
      ),
    );
  }
}
