import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeky_vote/core/constant.dart';

import '../Model/TeamRoomModel.dart';

class TeamRoomController with ChangeNotifier {
  TeamRoom teamData = new TeamRoom();
  
  TeamRoom get getTeamData{
    return teamData;
  }
  void enterRoom(String roomId) async {
    final prefs = await SharedPreferences.getInstance();
    final urlGetRoom = Uri.parse(ApiPath.joinRoom);
    final response = await http.post(urlGetRoom,
        headers: {
          'token': prefs.getString('token').toString(),
          "Content-Type": "application/json"
        },
        body: jsonEncode({'team_id': roomId}));
  }

  void fetchRoomData(String roomId) async{
        final prefs = await SharedPreferences.getInstance();
       final urlGetRoomData = Uri.parse(ApiPath.fectRoomData);
       final response = await http.post(urlGetRoomData,headers: {
          'token': prefs.getString('token').toString(),
          "Content-Type": "application/json"
        },body: json.encode({'team_id':roomId}));
       teamData = teamRoomFromJson(response.body);
       notifyListeners();

  }
}
