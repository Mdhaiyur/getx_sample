import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_sample/model/add_todo_response.dart';
import 'package:getx_sample/model/delete_todo.dart';
import 'package:getx_sample/model/request/add_todo.dart';
import 'package:getx_sample/model/request/login_request.dart';
import 'package:getx_sample/model/request/register_request.dart';
import 'package:getx_sample/model/request/update_status_todo.dart';
import 'package:getx_sample/model/request/update_todo.dart';
import 'package:getx_sample/model/todo.dart';
import 'package:getx_sample/model/todo_response.dart';
import 'package:getx_sample/model/user.dart';
import 'package:retrofit/http.dart';

import 'base_dio.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api-nodejs-todolist.herokuapp.com')
abstract class ApiClient{

  factory ApiClient({Dio? dio}) {
    dio ??= BaseDio.getInstance()?.getDio();
    return _ApiClient(dio!);
  }

  @POST('/user/login')
  Future<User> loginUser(@Body() LoginRequest loginRequest);

  @POST('/user/register')
  Future<User> registerUser(@Body() RegisterRequest loginRequest);

  @GET('/task')
  Future<TodoModel> getTodo(@Header("Authorization") String token);

  @PUT('/task/{id}')
  Future<TodoResponse> updateTodoStatus(@Header('Authorization') String token,@Path() String id,@Body() UpdateTodoStatus updateTodoStatus );

  @DELETE('/task/{id}')
  Future<DeleteTodo> deleteTodo(@Header('Authorization') String token,@Path() String id);

  @POST('/task')
  Future<AddTodoResponse> addTodo(@Header('Authorization') String token,@Body() AddTodo todoRequest);

  @PUT('/task/{id}')
  Future<TodoResponse> updateTodo(@Header('Authorization') String token,@Path() String id,@Body() UpdateTodo updateTodo );

}