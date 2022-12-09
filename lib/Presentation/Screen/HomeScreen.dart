import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Widget/BuildUserBox.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeSreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 4,
      itemBuilder: ((context, index) {
        return BuildUserBox();
      }),
    )));
  }
}
