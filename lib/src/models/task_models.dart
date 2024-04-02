
import 'dart:convert';

List<TaskModel> taskModelFromJson(String str) => List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String taskModelToJson(List<TaskModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
  String? id;
  String? comment;
  String? name;
  DateTime? status;
  String? owner;
  String? type;
  String? user;

  TaskModel({
    this.id,
    this.comment,
    this.name,
    this.status,
    this.owner,
    this.type,
    this.user,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    comment: json["comment"],
    name: json["name"],
    status: json["status"] == null ? null : DateTime.parse(json["status"]),
    owner: json["owner"],
    type: json["type"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comment": comment,
    "name": name,
    "status": status?.toIso8601String(),
    "owner": owner,
    "type": type,
    "user": user,
  };
}