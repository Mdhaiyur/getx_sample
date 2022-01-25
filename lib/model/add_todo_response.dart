// To parse this JSON data, do
//
//     final addTodoResponse = addTodoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:getx_sample/model/todo.dart';

AddTodoResponse addTodoResponseFromJson(String str) => AddTodoResponse.fromJson(json.decode(str));

String addTodoResponseToJson(AddTodoResponse data) => json.encode(data.toJson());

class AddTodoResponse {
  AddTodoResponse({
    this.success,
    this.data,
  });

  bool? success;
  Todo? data;

  factory AddTodoResponse.fromJson(Map<String, dynamic> json) => AddTodoResponse(
    success: json["success"],
    data: Todo.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
  };
}
