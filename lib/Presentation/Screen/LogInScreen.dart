import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/AuthController.dart';
import 'package:weeky_vote/Presentation/Screen/EnterRoomScreen.dart';
import 'package:weeky_vote/Presentation/Screen/HomeScreen.dart';
import 'package:weeky_vote/Presentation/Screen/RegisterScreen.dart';

import '../widget/BuildForm.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void OnSignIn() {
    try {
      if (_formKey.currentState!.validate()) return;
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/Image/background.jpeg"),
                fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildForm(
              text: "Email",
              validation: (value) {},
              acceptValue: (value) {
                _email = value.trim();
              },
            ),
            BuildForm(
              text: "Password",
              validation: (value) {},
              acceptValue: (value) {
                _password = value.trim();
              },
            ),
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
                            print(_email);
                            print(_password);
                      Provider.of<AuthController>(context, listen: false)
                

                          .SignUp(_email, _password);
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
