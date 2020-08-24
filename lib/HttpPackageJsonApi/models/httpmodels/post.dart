// To parse this JSON data, do
//
//     final postPlaceHolder = postPlaceHolderFromJson(jsonString);

import 'dart:convert';

PostPlaceHolder postPlaceHolderFromJson(String str) => PostPlaceHolder.fromJson(json.decode(str));

String postPlaceHolderToJson(PostPlaceHolder data) => json.encode(data.toJson());

class PostPlaceHolder {
  PostPlaceHolder({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostPlaceHolder.fromJson(Map<String, dynamic> json) => PostPlaceHolder(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
