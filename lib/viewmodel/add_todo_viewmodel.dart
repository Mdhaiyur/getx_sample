import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/model/add_todo_response.dart';
import 'package:getx_sample/model/request/add_todo.dart';
import 'package:getx_sample/network/api_client.dart';
import 'package:getx_sample/network/base_dio.dart';
import 'package:getx_sample/network/dio_error.dart';
import 'package:getx_sample/util/app_utils.dart';

class AddTodoViewModel extends GetxController
{
  final _isLoading =false.obs;
  var box=GetStorage();

  get loading => _isLoading.value;

  ///add todos api call
  addTodo(String todo) async
  {
    try{
      _isLoading.value=true;
      AddTodo todoRequest=AddTodo(description: todo);
      AddTodoResponse todoResponse=await ApiClient().addTodo(box.read('token'),todoRequest);
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