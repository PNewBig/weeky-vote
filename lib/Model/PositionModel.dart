import 'dart:convert';

List<PositionModel> positionModelFromJson(String str) => List<PositionModel>.from(json.decode(str).map((x) => PositionModel.fromJson(x)));

String positionModelToJson(List<PositionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PositionModel {
      int? psId;
    String? psName;
    dynamic psDesc;
    PositionModel({
        this.psId,
        this.psName,
        this.psDesc,
    });



    factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
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
