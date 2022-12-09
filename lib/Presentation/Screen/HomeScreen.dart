import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Page/HomePage.dart';
import 'package:weeky_vote/Presentation/Page/ProfilePage.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeSreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  List<Map<String, Object>> selectedPage = [
    {'page': HomePage()},
    {'page': ProfilePage(name: "vanlakhna")}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedPage[_selectIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.grey.withOpacity(0.9),
          currentIndex: _selectIndex,
          onTap: (value) {
            setState(() {
              _selectIndex = value.toInt();
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Personal")
          ]),
    );
  }
}
