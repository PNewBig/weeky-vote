import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeky_vote/core/ApiPath.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // it is where we manage method post and get to fetch data and post data to backend
  static Future<Response> postData(String urlParams, Map<String, dynamic> dataParams) async {
    final prefs = await SharedPreferences.getInstance();
    final _url = Uri.parse(urlParams);
    final response = await http.post(_url,
        headers: {
          'token': prefs.getString('token').toString(),
          "Content-Type": "application/json"
        },
        body: jsonEncode(dataParams));
      return response;
  }

  static Future<Response> getData(Map<String, String> header,String urlParams) async {
    final _url = Uri.parse(urlParams);
    Response response;
    if(header != null){
      response = await http.get(_url,headers: header);
    }else{
     response = await http.get(_url,headers: {});
    }
    
    return response;
  }

  static Future<Response> postRegis(Map<String, dynamic> dataParams) async{
       final urlRegis = Uri.parse(ApiPath.register);
       final respone = await http.post(urlRegis , headers: {"Content-Type": "application/json"},
       body: jsonEncode(dataParams));
       return respone;
  }
}
