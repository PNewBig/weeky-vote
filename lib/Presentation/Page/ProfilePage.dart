import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/TeamRoomController.dart';
import 'package:weeky_vote/Presentation/widget/BuildForm.dart';

class ProfilePage extends StatefulWidget {
  String name;
  ProfilePage({required this.name, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<TeamRoomController>(
      context,
    ).fetchPersonalPoint();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamRoomController>(
        builder: (context, personalPoint, child) {
      double percent = personalPoint.getTotalPoint?.percent?.toDouble() ?? 0;
      String email = personalPoint.getTotalPoint?.email?.toString() ?? "";
      return Container(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(
                                image: AssetImage("asset/Image/comment.png")))),
                    SizedBox(height: 10),
                    Container(
                        height: 50,
                        width: 250,
                        child: Card(
                          child: Center(
                              child: Text(email,
                                  style:
                                      Theme.of(context).textTheme.bodyText1)),
                        ))
                  ],
                )),
            Container(
              width: 300,
              height: 330,
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your Point:",
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  CircularPercentIndicator(
                    animation: true,
                    radius: 100,
                    lineWidth: 20,
                    percent: percent / 100,
                    progressColor: Colors.deepPurple,
                    backgroundColor: Colors.deepPurple.shade100,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '${personalPoint.getTotalPoint?.percent} %',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 241, 243),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            )
          ],
        ),
      );
    });
  }
}
