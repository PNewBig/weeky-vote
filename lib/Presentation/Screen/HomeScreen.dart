import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/TeamRoomController.dart';
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
  
   


  @override
  Widget build(BuildContext context) {
 String teamId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: _selectIndex == 0 ? HomePage(teamId: teamId) : ProfilePage(name: 'Vanlakhan',),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey.withOpacity(0.9),
          selectedItemColor: Theme.of(context).primaryColor,
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
