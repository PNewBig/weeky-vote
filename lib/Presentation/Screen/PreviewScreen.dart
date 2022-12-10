import 'package:flutter/material.dart';

import '../widget/BuildForm.dart';

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
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            height: 300,
            child: Text("BottomSheet"));
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
          SizedBox(
            height: 50,
          ),
          Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Point"),
                        SizedBox(height: 10),
                        Container(child: Center(child: Text("10")))
                      ],
                    ))
              ])),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext) {
                  return SizedBox(
                    child: Column(
                      children: [
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
                                        child: Text("1.Comments",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall)),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 10),
                                            border: InputBorder.none),
                                      ),
                                    )
                                  ])),
                        ),
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
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 10),
                                            border: InputBorder.none),
                                      ),
                                    )
                                  ])),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: ElevatedButton(
                                child: Text("Save"),
                                onPressed: () {
                                  // Provider.of<AuthController>(context, listen: false)
                                  //     .SignUp(_email, _password);
                                })),
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.rate_review_outlined)),
    );
  }
}
