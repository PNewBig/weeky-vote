import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/CommentModel.dart';
import '../core/constant.dart';

class CommentController with ChangeNotifier {
  CommentModel? _comment;
  CommentModel? get getComment{
    return _comment;
  }
  void fetchComment(String userId, String teamId) async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final urlFetch = Uri.parse(ApiPath.getComment);
      final respone = await http.post(urlFetch,headers: {
          'token': prefs.getString('token').toString(),
          "Content-Type": "application/json"},
          body: jsonEncode({
        'team_id': teamId,
        'user_id': userId}));
      _comment = commentModelFromJson(respone.body);
      notifyListeners();
    } catch (error) {
      
    }
  }

  void addComment(String msg,int point,String userId, String teamId) async {
    try {
      print(msg);
      final prefs = await SharedPreferences.getInstance();
      final urlAdd = Uri.parse(ApiPath.postCommnet);
      final response = await http.post(urlAdd, headers: {
          'token': prefs.getString('token').toString(),
          "Content-Type": "application/json"},body: json.encode({
           'team_id':teamId,
           'user_id':userId,
           'point': point,
           'Comment':msg}));
      print(response.statusCode);
    } catch (error) {
      print(error);
    }
  }
}
