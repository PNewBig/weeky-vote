import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weeky_vote/Presentation/widget/BuildForm.dart';

class ProfilePage extends StatelessWidget {
  String name;
  ProfilePage({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
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
                      width: 150,
                      child: Card(
                        child: Center(
                            child: Text(name,
                                style: Theme.of(context).textTheme.bodyText1)),
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
                  percent: 0.4,
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '40%',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.only(
                        left: 30.0, top: 1.0, right: 30.0, bottom: 20.0),
                    height: 30,
                    // color: Color.fromARGB(255, 16, 47, 34),
                    child: Card(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("date:",
                              style: Theme.of(context).textTheme.bodyText1)),
                    ))
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 241, 243),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
