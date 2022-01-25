import 'package:get/get.dart';
import 'package:getx_sample/viewmodel/add_todo_viewmodel.dart';
import 'package:getx_sample/viewmodel/login_viewmodel.dart';
import 'package:getx_sample/viewmodel/signup_viewmodel.dart';
import 'package:getx_sample/viewmodel/todo_viewmodel.dart';
import 'package:getx_sample/viewmodel/update_todo_viewmodel.dart';

class AppBiding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
    Get.lazyPut(() => SignupViewModel());
    Get.lazyPut(() => TodoViewModel());
    Get.lazyPut(() => AddTodoViewModel(),fenix: true);
    Get.lazyPut(() => UpdateTodoViewModel(),fenix: true);
  }

}