import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/model/delete_todo.dart';
import 'package:getx_sample/model/request/update_status_todo.dart';
import 'package:getx_sample/model/todo.dart';
import 'package:getx_sample/model/todo_response.dart';
import 'package:getx_sample/network/api_client.dart';
import 'package:getx_sample/network/base_dio.dart';
import 'package:getx_sample/network/dio_error.dart';
import 'package:getx_sample/util/app_utils.dart';

class TodoViewModel extends GetxController
{
  final _isLoading =false.obs;
  var box=GetStorage();
  var todoList=[].obs;

  get loading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    getTodo();
  }

  ///fetch todos api call
  getTodo() async {
    try{
      _isLoading.value=true;
      TodoModel todo=await ApiClient().getTodo(box.read('token'));
      todoList.clear();
      todoList.addAll(todo.data!);
      _isLoading.value=false;
    }catch(e){
      _isLoading.value=false;
      DiosError? error=BaseDio.getInstance()?.getDioError(e);
      Utils().showSnackbar(msg: error!.message!, snackbarTitle: "Error");
    }
  }
  ///update status
  updateStatus(bool status,String id,int index) async {
    try{
      UpdateTodoStatus updateTodoStatus=UpdateTodoStatus(completed: status);
      TodoResponse todoResponse=await ApiClient().updateTodoStatus(box.read('token'),id,updateTodoStatus);
      todoList.replaceRange(index, index+1, [todoResponse.data!]);
    }catch(e){
      DiosError? error=BaseDio.getInstance()?.getDioError(e);
      Utils().showSnackbar(msg: error!.message!, snackbarTitle: "Error");
    }
  }

  ///Delete todos
  deleteTodo(String id,int index) async
  {
    try{
       _isLoading.value=true;
       DeleteTodo todoResponse=await ApiClient().deleteTodo(box.read('token'),id);
       todoList.removeAt(index);
      _isLoading.value=false;
    }catch(e){
      _isLoading.value=false;
      DiosError? error=BaseDio.getInstance()?.getDioError(e);
      Utils().showSnackbar(msg: error!.message!, snackbarTitle: "Error");
    }
  }
}