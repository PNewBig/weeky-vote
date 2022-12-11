import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildBoxComment extends StatelessWidget {
  String comment;
  String voteAt;
  BuildBoxComment({required this.comment,required this.voteAt,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5),
            child: Text(comment, style: Theme.of(context).textTheme.bodyText1)),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5),
            child: Text(DateFormat.yMMMMd().format(DateTime.parse(voteAt)), style: Theme.of(context).textTheme.bodyText1))
        ],)
    ));
  }
}