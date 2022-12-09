import 'package:flutter/material.dart';

class EnterRoomScreen extends StatelessWidget {
  const EnterRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/Image/background.jpeg")))));
  }
}
