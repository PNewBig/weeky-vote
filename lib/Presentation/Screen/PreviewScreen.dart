import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  static const String routeName = "/PreviewScreen";
  String name;
  PreviewScreen({required this.name, super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

void CommentBottomSheet(BuildContext ctx){
  showModalBottomSheet(context: ctx, builder: (context){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
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
                            child: Card(child: Center(child: Text(widget.name, style: Theme.of(context).textTheme.bodyText1)),))
                        ],)
                      ),
                      SizedBox(height: 50,),
                      Container(
                        width: double.infinity,
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal:20 ),
                         decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),  
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text("Total Point"),
                                SizedBox(height: 10),
                                Container(child: Center(child: Text("10")))
                          ],))
                        ])),
                      
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){
        CommentBottomSheet(context);
      }, child: Icon(Icons.rate_review_outlined)),
    );
  }
}
