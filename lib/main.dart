import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Screen/LogInScreen.dart';
import 'package:weeky_vote/Presentation/Screen/RegisterScreen.dart';
import './Presentation/Screen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              bodySmall:
                  TextStyle(fontSize: 14, fontFamily: "defogo notosans"))),
      initialRoute: '/',
      routes: {
        '/': (context) => LogInScreen(),
        RegisterScreen.routeName: (context) => LogInScreen()
      },
    );
  }
}
