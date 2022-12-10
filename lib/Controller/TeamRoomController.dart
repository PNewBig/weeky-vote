import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TeamRoomController with ChangeNotifier {
  String _urlMain = "http://192.168.50.245:3000/api/";

  void EnterRoom(String roomId) async {
    final prefs = await SharedPreferences.getInstance();
    final urlGetRoom = Uri.parse(_urlMain + "teams/jointeam");
    final response = await http.post(urlGetRoom,
        headers: {
          'token': prefs.getString('token').toString(),
          "Content-Type": "application/json"
        },
        body: jsonEncode({'team_id': roomId}));
  }

  void FetchRoomData(String roomId) async {
    final urlGetRoomData = Uri.parse(_urlMain + "teams/getDetailsTeam");
    final response =
        await http.post(urlGetRoomData, body: json.encode({'team_id': roomId}));
    print(response.body);
  }

  void GetAllRoom() async {
    final urlGetAllRoom = Uri.parse(_urlMain + "teams/GetTeamOfUser");
    final prefs = await SharedPreferences.getInstance();
    final response = await http.get(urlGetAllRoom,
        headers: {'token': prefs.getString('token').toString()});
  }
}
