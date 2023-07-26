import 'dart:convert';
TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));
String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  int? id;
  String? title;
  String? desc;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? reminder;
  String? repeat;

  TaskModel({
    this.id,
    this.title,
    this.desc,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.reminder,
    this.repeat,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    desc: json["desc"],
    isCompleted: json["isCompleted"],
    date: json["date"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    reminder: json["reminder"],
    repeat: json["repeat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "isCompleted": isCompleted,
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
    "reminder": reminder,
    "repeat": repeat,
  };
}
