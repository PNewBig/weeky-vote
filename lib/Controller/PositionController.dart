import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weeky_vote/Model/PositionModel.dart';
import 'package:http/http.dart' as http;
import 'package:weeky_vote/core/ApiService.dart';
import 'package:weeky_vote/core/constant.dart';

class PositionController with ChangeNotifier {
  PositionModel? positionData;
  PositionModel? get getListPosition {
    return positionData;
  }

  void fetchPosition() async {
    try {
      Response response = await ApiService.getData({},ApiPath.getPosition);
      positionData = positionModelFromJson(response.body);
      notifyListeners();
    } catch (error) {
       
    }
  }
}
