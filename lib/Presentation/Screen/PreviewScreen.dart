import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/CommentContoller.dart';
import 'package:weeky_vote/Presentation/Widget/BuildBoxComment.dart';
import '../widget/BuildForm.dart';

class PreviewScreen extends StatefulWidget {
  static const String routeName = "/PreviewScreen";
  String name;
  PreviewScreen({required this.name, super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  String? _msg;
  int? _point;
  String? _userId;
  String? _teamId;
  String? _fname;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _userId = argument['userId'] as String;
    _teamId = argument['teamId'] as String;
    _fname = argument['fname'];
    Provider.of<CommentController>(context, listen: false)
        .fetchComment(_userId!, _teamId!);
  }

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
                            child: Text(_fname!,
                                style: Theme.of(context).textTheme.bodyText1)),
                      ))
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 500,
            child: Consumer<CommentController>(
                builder: (context, commentData, child) {
              if (commentData.getComment != null) {
                return ListView.builder(
                    itemCount: commentData.getComment!.result!.length,
                    itemBuilder: (context, index) {
                      return BuildBoxComment(
                          comment: commentData
                              .getComment!.result![index].comment
                              .toString(),
                          voteAt: commentData.getComment!.result![index].voteAt
                              .toString());
                    });
              } else {
                return Container(child: Text(""));
              }
            }),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: showCommentBottomSheet,
          child: Icon(Icons.rate_review_outlined)),
    );
  }

 void postComment(){
  Provider.of<CommentController>(context, listen: false).addComment(_msg!, _point!, _userId!, _teamId!);
 }
  void showCommentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext) {
          return SizedBox(
            child: Column(
              children: [
                Center(
                  //1.comments
                  child: BuildForm(text: "Comment", acceptValue: (value){
                       _msg = value.trim();
                  }, validation: (value){})
                ),
                //2. Point
                Center(
                  child: BuildForm(text: "Point", acceptValue: (value){
                         _point = int.parse(value.trim());
                  }, validation: (value) {
                    
                  },),
                ),
                Container(
                    width: double.infinity,
                    height: 100,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                        child: Text("Save"),
                        onPressed: () {
                         postComment();
                        })),
              ],
            ),
          );
        });
  }
}
