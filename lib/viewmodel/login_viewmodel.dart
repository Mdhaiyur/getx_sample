import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/model/request/login_request.dart';
import 'package:getx_sample/model/user.dart';
import 'package:getx_sample/network/api_client.dart';
import 'package:getx_sample/network/base_dio.dart';
import 'package:getx_sample/network/dio_error.dart';
import 'package:getx_sample/util/app_utils.dart';
import 'package:getx_sample/view/todo_screen.dart';

class LoginViewModel extends GetxController
{
  final _isLoading =false.obs;
  var box=GetStorage();

  setLoading(bool isLoading){
    _isLoading.value=isLoading;
    update();
  }

  get loading => _isLoading.value;

  ///login user api call
  loginUser(String email,String password) async {
    try{
      setLoading(true);
      LoginRequest request=LoginRequest(email: email,password: password);
      User user=await ApiClient().loginUser(request);

      if(user!=null){
        setLoading(false);
        box.write('token', user.token);
        Get.offAll(TodoScreen());
      }
    }catch(e){
      setLoading(false);
      DiosError? error=BaseDio.getInstance()?.getDioError(e);
      Utils().showSnackbar(msg: error!.message!, snackbarTitle: "Error");
    }
  }
}