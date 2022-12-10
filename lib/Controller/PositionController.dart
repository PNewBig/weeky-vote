import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:weeky_vote/Model/PositionModel.dart';
import 'package:http/http.dart' as http;
import 'package:weeky_vote/core/constant.dart';

class PositionController with ChangeNotifier{
  String _mainUrl = "http://192.168.50.245:3000/api/";
   List<PositionModel> listPosition = [];
   List<PositionModel> get getListPosition{
    return [...listPosition];
   }
   void FetchPosition() async{
       try{
        final _urlGet = Uri.parse(ApiPath.getPosition);
        final response = await http.get(_urlGet);
        listPosition = positionModelFromJson(response.body);
        notifyListeners();
       }catch(error){
        // throw error;
       }
   }
}