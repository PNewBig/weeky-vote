import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Image(image: AssetImage("asset/Image/comment.png")))),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 150,
                            child: Card(child: Center(child: Text(name, style: Theme.of(context).textTheme.bodyText1)),))
                        ],)
                      ),
         
         Container(
          margin: const EdgeInsets.only(top: 150),
           child: CircularPercentIndicator(
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
         ),
          
        ],
      ),
    );
  }
}
