import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeky_vote/Model/PersonalPoint.dart';
import 'package:weeky_vote/core/ApiService.dart';
import 'package:weeky_vote/core/ApiPath.dart';

import '../Model/TeamRoomModel.dart';

class TeamRoomController with ChangeNotifier {
  TeamRoom teamData = new TeamRoom();
  TeamRoom get getTeamData {
    return teamData;
  }

  TotalPoint? totalPoint;
  TotalPoint? get getTotalPoint{
    return totalPoint;
  }

  void enterRoom(String roomId) async {
    try {
      final response = await ApiService.postData(ApiPath.joinRoom, {'team_id': roomId});
    } catch (error){

    }
  }

  void fetchRoomData(String roomId) async {
    Response response =
        await ApiService.postData(ApiPath.fectRoomData, {'team_id': roomId});
    teamData = teamRoomFromJson(response.body);
    notifyListeners();
  }

  void fetchPersonalPoint() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print(prefs.getString('token').toString());
      final response = await ApiService.getData({'token':prefs.getString('token').toString()}, ApiPath.getPointSum);
      totalPoint = totalPointFromJson(response.body); 
      notifyListeners();
    } catch (error) {
         
    }
  }
}
