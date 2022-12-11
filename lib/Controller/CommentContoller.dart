import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeky_vote/core/ApiService.dart';
import '../Model/CommentModel.dart';
import '../core/ApiPath.dart';

class CommentController with ChangeNotifier {
  CommentModel? _comment;
  CommentModel? get getComment{
    return _comment;
  }
  Future<void> fetchComment(String userId, String teamId) async {
    try {

      // call api service 
     final response = await ApiService.postData(ApiPath.getComment, {
        'team_id': teamId,
        'user_id': userId});
      _comment = commentModelFromJson(response.body);
      notifyListeners();
    } catch (error) {
      
    }
  }

  Future<void> addComment(String msg,int point,String userId, String teamId) async {
    try {
    final response = ApiService.postData(ApiPath.postCommnet, {
           'team_id':teamId,
           'user_id':userId,
           'point': point,
           'Comment':msg});
    } catch (error) {
      print(error);
    }
  }
}
