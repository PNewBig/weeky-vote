import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Model/CommentModel.dart';

class CommentController with ChangeNotifier {
  String _urlMain = "";
  List<CommentModel> listComment = [];

  void FetchComment() async {
    try {
      final urlFetch = Uri.parse(_urlMain);
      final respone = await http.get(urlFetch);
      final extractComment = json.decode(respone.body);
    } catch (error) {
      print(error);
    }
  }

  void AddComment() async {
    try {
      final urlAdd = Uri.parse(_urlMain);
      final response = await http.post(urlAdd, body: {});
    } catch (error) {
      print(error);
    }
  }
}
