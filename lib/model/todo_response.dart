// To parse this JSON data, do
//
//     final todoResponse = todoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:getx_sample/model/todo.dart';

TodoResponse todoResponseFromJson(String str) => TodoResponse.fromJson(json.decode(str));

String todoResponseToJson(TodoResponse data) => json.encode(data.toJson());

class TodoResponse {
  TodoResponse({
    this.success,
    this.data,
  });

  bool? success;
  Todo? data;

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
    success: json["success"],
    data: Todo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
  };
}
