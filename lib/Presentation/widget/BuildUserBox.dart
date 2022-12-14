import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/Screen/PreviewScreen.dart';

class BuildUserBox extends StatelessWidget {
  String fname;
  String lname;
  String userId;
  String teamId;
  BuildUserBox(
      {required this.fname,
      required this.lname,
      required this.userId,
      required this.teamId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("it work");
        Navigator.of(context).pushNamed(PreviewScreen.routeName, arguments: {
          'fname': fname,
          'lname': lname,
          "userId": userId,
          'teamId': teamId
        });
      },
      child: Container(
        key: ValueKey(userId),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amberAccent, Colors.amber.withOpacity(0.9)],
                  begin: Alignment.topCenter,
                  end: Alignment.center),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(children: [
            Positioned(
              right: 5,
              child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text("New",
                          style: Theme.of(context).textTheme.bodyText2))),
            ),
            Positioned(
                top: 5,
                left: 5,
                child: Container(
                    height: 80,
                    width: 80,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image(
                            image: AssetImage("asset/Image/comment.png"))))),
            Positioned(
                top: 100,
                left: 10,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fname, style: Theme.of(context).textTheme.bodyText1),
                      Text(lname, style: Theme.of(context).textTheme.bodyText1)
                    ]))
          ])),
    );
  }
}
