import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Model/CommentModel.dart';
import '../core/constant.dart';

class CommentController with ChangeNotifier {
  List<CommentModel> listComment = [];

  void fetchComment() async {
    try {
      final urlFetch = Uri.parse(ApiPath.getComment);
      final respone = await http.get(urlFetch);
      final extractComment = json.decode(respone.body);
    } catch (error) {
      print(error);
    }
  }

  void addComment() async {
    try {
      final urlAdd = Uri.parse(ApiPath.postCommnet);
      final response = await http.post(urlAdd, body: {});
    } catch (error) {
      print(error);
    }
  }
}
