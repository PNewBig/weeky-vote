// To parse this JSON data, do
//
//     final teamRoom = teamRoomFromJson(jsonString);

import 'dart:convert';

TeamRoom teamRoomFromJson(String str) => TeamRoom.fromJson(json.decode(str));

String teamRoomToJson(TeamRoom data) => json.encode(data.toJson());

class TeamRoom {
    TeamRoom({
        this.teamId,
        this.teamName,
        this.imageUrl,
        this.commentDay,
        this.description,
        this.list,
    });

    String? teamId;
    String? teamName;
    String? imageUrl;
    String? commentDay;
    String? description;
    List<ListElement>? list;

    factory TeamRoom.fromJson(Map<String, dynamic> json) => TeamRoom(
        teamId: json["team_id"] == null ? null : json["team_id"],
        teamName: json["team_name"] == null ? null : json["team_name"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        commentDay: json["comment_day"] == null ? null : json["comment_day"],
        description: json["description"] == null ? null : json["description"],
        list: json["List"] == null ? null : List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "team_id": teamId == null ? null : teamId,
        "team_name": teamName == null ? null : teamName,
        "image_url": imageUrl == null ? null : imageUrl,
        "comment_day": commentDay == null ? null : commentDay,
        "description": description == null ? null : description,
        "List": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    ListElement({
        this.userId,
        this.fname,
        this.lname,
        this.imagePf,
        this.status,
        this.memberId,
        this.psName,
        this.teamName,
        this.imageUrl,
        this.commentDay,
        this.description,
    });

    String? userId;
    String? fname;
    String? lname;
    String? imagePf;
    String? status;
    int? memberId;
    String? psName;
    String? teamName;
    String? imageUrl;
    String? commentDay;
    String? description;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        userId: json["user_id"] == null ? null : json["user_id"],
        fname: json["fname"] == null ? null : json["fname"],
        lname: json["lname"] == null ? null : json["lname"],
        imagePf: json["imagePf"] == null ? null : json["imagePf"],
        status: json["Status"] == null ? null : json["Status"],
        memberId: json["MEMBER_ID"] == null ? null : json["MEMBER_ID"],
        psName: json["PS_name"] == null ? null : json["PS_name"],
        teamName: json["team_name"] == null ? null : json["team_name"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        commentDay: json["comment_day"] == null ? null : json["comment_day"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "fname": fname == null ? null : fname,
        "lname": lname == null ? null : lname,
        "imagePf": imagePf == null ? null : imagePf,
        "Status": status == null ? null : status,
        "MEMBER_ID": memberId == null ? null : memberId,
        "PS_name": psName == null ? null : psName,
        "team_name": teamName == null ? null : teamName,
        "image_url": imageUrl == null ? null : imageUrl,
        "comment_day": commentDay == null ? null : commentDay,
        "description": description == null ? null : description,
    };
}
