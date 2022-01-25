import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/model/request/update_todo.dart';
import 'package:getx_sample/model/todo.dart';
import 'package:getx_sample/model/todo_response.dart';
import 'package:getx_sample/network/api_client.dart';
import 'package:getx_sample/network/base_dio.dart';
import 'package:getx_sample/network/dio_error.dart';
import 'package:getx_sample/util/app_utils.dart';

class UpdateTodoViewModel extends GetxController {
  final todoController = TextEditingController();
  final _isLoading = false.obs;
  var box = GetStorage();

  get loading => _isLoading.value;

  Todo? todo;
  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      todo = Get.arguments;
      todoController.text = todo!.description!;
    }
  }

  ///update todos
  updateTodo(String description) async
  {
    try{
      _isLoading.value=true;
      UpdateTodo updateTodo=UpdateTodo(description);
      TodoResponse todoResponse=await ApiClient().updateTodo(box.read('token'),todo!.id!,updateTodo);
      if(todoResponse.success!){
        Get.back(result: true);
      }
      _isLoading.value=false;
    }catch(e){
      _isLoading.value=false;
      DiosError? error=BaseDio.getInstance()?.getDioError(e);
      Utils().showSnackbar(msg: error!.message!, snackbarTitle: "Error");
    }
  }
}
