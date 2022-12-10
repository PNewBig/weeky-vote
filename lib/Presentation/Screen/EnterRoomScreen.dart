import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/TeamRoomController.dart';

class EnterRoomScreen extends StatefulWidget {
  static const String routeName = "/enterScreen";
  EnterRoomScreen({super.key});

  @override
  State<EnterRoomScreen> createState() => _EnterRoomScreenState();
}

class _EnterRoomScreenState extends State<EnterRoomScreen> {
  String enterRoomId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/Image/background.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //pin text
            TextField(
              onChanged: (value) {
                enterRoomId = value.trim().toString();
              },
              decoration: InputDecoration(
                hintText: 'Enter Pin',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blueAccent,
                  ),
                ),
                onPressed: () {
                  print(enterRoomId);
                  Provider.of<TeamRoomController>(context, listen: false).EnterRoom(enterRoomId);
                },
                child: Text(
                  "Confirm"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}