import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_sample/model/request/register_request.dart';
import 'package:getx_sample/model/user.dart';
import 'package:getx_sample/network/api_client.dart';
import 'package:getx_sample/network/base_dio.dart';
import 'package:getx_sample/network/dio_error.dart';
import 'package:getx_sample/util/app_utils.dart';
import 'package:getx_sample/view/todo_screen.dart';

class SignupViewModel extends GetxController
{
  final _isLoading =false.obs;
  var box=GetStorage();

  setLoading(bool isLoading){
    _isLoading.value=isLoading;
    update();
  }

  get loading => _isLoading.value;

  ///signup user api call
  registerUser(String email,String password,String name,int age) async {
    try{
      setLoading(true);
      RegisterRequest request=RegisterRequest(email: email,password: password,age: age,name: name);
      User user=await ApiClient().registerUser(request);

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