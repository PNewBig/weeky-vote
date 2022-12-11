import 'dart:convert';

TotalPoint totalPointFromJson(String str) => TotalPoint.fromJson(json.decode(str));

String totalPointToJson(TotalPoint data) => json.encode(data.toJson());

class TotalPoint {
    TotalPoint({
        this.type,
        this.percent,
        this.sumpoint,
        this.email,
    });

    String? type;
    int? percent;
    String? sumpoint;
    String? email;

    factory TotalPoint.fromJson(Map<String, dynamic> json) => TotalPoint(
        type: json["type"] == null ? null : json["type"],
        percent: json["percent"] == null ? null : json["percent"],
        sumpoint: json["sumpoint"] == null ? null : json["sumpoint"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "percent": percent == null ? null : percent,
        "sumpoint": sumpoint == null ? null : sumpoint,
        "email": email == null ? null : email,
    };
}