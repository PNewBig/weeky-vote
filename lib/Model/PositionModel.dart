// To parse this JSON data, do
//
//     final positionModel = positionModelFromJson(jsonString);

import 'dart:convert';

PositionModel positionModelFromJson(String str) => PositionModel.fromJson(json.decode(str));

String positionModelToJson(PositionModel data) => json.encode(data.toJson());

class PositionModel {
    PositionModel({
        this.type,
        this.result,
    });

    String? type;
    List<Result>? result;

    factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
        type: json["type"] == null ? null : json["type"],
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "result": result == null ? null : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.psId,
        this.psName,
        this.psDesc,
    });

    int? psId;
    String? psName;
    dynamic psDesc;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        psId: json["PS_ID"] == null ? null : json["PS_ID"],
        psName: json["PS_name"] == null ? null : json["PS_name"],
        psDesc: json["PS_desc"],
    );

    Map<String, dynamic> toJson() => {
        "PS_ID": psId == null ? null : psId,
        "PS_name": psName == null ? null : psName,
        "PS_desc": psDesc,
    };
}
