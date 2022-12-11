import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
    CommentModel({
        this.type,
        this.sumpoint,
        this.result,
    });

    String? type;
    String? sumpoint;
    List<Result>? result;

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        type: json["type"] == null ? null : json["type"],
        sumpoint: json["sumpoint"] == null ? null : json["sumpoint"],
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "sumpoint": sumpoint == null ? null : sumpoint,
        "result": result == null ? null : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.voteId,
        this.comment,
        this.voteAt,
    });

    int? voteId;
    String? comment;
    DateTime? voteAt;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        voteId: json["vote_id"] == null ? null : json["vote_id"],
        comment: json["Comment"] == null ? null : json["Comment"],
        voteAt: json["voteAt"] == null ? null : DateTime.parse(json["voteAt"]),
    );

    Map<String, dynamic> toJson() => {
        "vote_id": voteId == null ? null : voteId,
        "Comment": comment == null ? null : comment,
        "voteAt": voteAt == null ? null : voteAt!.toIso8601String(),
    };
}
