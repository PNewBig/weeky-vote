import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weeky_vote/Presentation/widget/BuildTextField.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child: Form(
            child: Column(
              children: [
                Container(
                  child: Text("Create Room"),
                ),
                BuildTextField(text: "Teams Name"),
              ],
            ),
          )),
    );
  }
}
