import 'package:flutter/material.dart';

import '../Widget/BuildUserBox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 4,
        itemBuilder: ((context, index) {
          return BuildUserBox();
        }),
      ));
  }
}