// To parse this JSON data, do
//
//     final deleteTodo = deleteTodoFromJson(jsonString);

import 'dart:convert';

DeleteTodo deleteTodoFromJson(String str) => DeleteTodo.fromJson(json.decode(str));

String deleteTodoToJson(DeleteTodo data) => json.encode(data.toJson());

class DeleteTodo {
  DeleteTodo({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory DeleteTodo.fromJson(Map<String, dynamic> json) => DeleteTodo(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
