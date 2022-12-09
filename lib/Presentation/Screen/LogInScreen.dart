import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Screen/RegisterScreen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("HomePage")),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(RegisterScreen.routeName);
      }),
    );
  }
}