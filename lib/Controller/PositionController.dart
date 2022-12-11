import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:weeky_vote/Model/PositionModel.dart';
import 'package:http/http.dart' as http;
import 'package:weeky_vote/core/constant.dart';

class PositionController with ChangeNotifier {
  PositionModel? positionData;
  PositionModel? get getListPosition {
    return positionData;
  }

  void FetchPosition() async {
    try {
      print("it is work");
      final _urlGet = Uri.parse(ApiPath.getPosition);
      final response = await http.get(_urlGet);
      print(response.statusCode);
      positionData = positionModelFromJson(response.body);

      notifyListeners();
    } catch (error) {
      // throw error;
    }
  }
}
