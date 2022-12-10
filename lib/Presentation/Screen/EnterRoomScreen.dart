import 'package:flutter/material.dart';

class EnterRoomScreen extends StatelessWidget {
  static const String routeName = "/enterScreen";
  const EnterRoomScreen({super.key});

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
            const TextField(
              decoration: InputDecoration(
                hintText: 'Pin',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(140, 10, 140, 10)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blueAccent,
                ),
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.red,
                ),
                shadowColor: MaterialStateProperty.all<Color>(
                  Colors.pink,
                ),
              ),
              onPressed: () {
                print("Confirm Pressed");
              },
              child: const Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
