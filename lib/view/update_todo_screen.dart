import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_sample/util/app_utils.dart';
import 'package:getx_sample/view/widget/custom_textfield.dart';
import 'package:getx_sample/view/widget/customer_button.dart';
import 'package:getx_sample/viewmodel/update_todo_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTodoScreen extends GetView<UpdateTodoViewModel>
{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Update Todo',
            style: GoogleFonts.poppins(
                textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Column(
              children: [
                Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CustomTextField(
                    controller: controller.todoController,
                    fillColor: const Color(0xfff2efe6),
                    hint: 'Add Todo',
                    textColor: Colors.black,
                    isObscure: false,
                    maxlines: 7,
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    backgroundColor: Color(0xfff7957c),
                    title: 'Save',
                    onPress: () {
                      if (controller.todoController.text.isEmpty) {
                        Utils().showSnackbar(
                            msg: "Todo must be entered.",
                            snackbarTitle: "Error");
                      } else {
                        controller.updateTodo(controller.todoController.text);
                      }
                    })
              ],
            ),
            Obx(() {
              return controller.loading
                  ? const Positioned(
                  child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                      )))
                  : Container();
            }),
          ],
        ),
      ),
    );
  }
}