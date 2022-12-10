import 'package:flutter/material.dart';
import 'package:weeky_vote/Presentation/widget/BuildForm.dart';

class PreviewScreen extends StatefulWidget {
  static const String routeName = "/PreviewScreen";
  String name;
  PreviewScreen({required this.name, super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

void CommentBottomSheet(BuildContext ctx) {
  showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return Container(height: 500, child: Text("BottomSheet"));
      });
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            child: Text(widget.name,
                                style: Theme.of(context).textTheme.bodyText1)),
                      ))
                ],
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // CommentBottomSheet();
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Column(
                      children: [
                        Center(child: BuildForm(text: "1.Comments")),
                        Center(
                            child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, top: 10),
                                    child: Text("2.Point",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)),
                                SizedBox(height: 10),
                                Container()
                              ]),
                        )),
                        Center(
                          child: Card(
                            child: Container(
                              child: Text("Save",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.rate_review_outlined)),
    );
  }
}
