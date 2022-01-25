import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/util/app_utils.dart';
import 'package:getx_sample/view/widget/custom_textfield.dart';
import 'package:getx_sample/view/widget/customer_button.dart';
import 'package:getx_sample/viewmodel/add_todo_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTodoScreen extends GetView<AddTodoViewModel> {
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Add Todo',
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
                    controller: todoController,
                    fillColor: Color(0xfff2efe6),
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
                      if (todoController.text.isEmpty) {
                        Utils().showSnackbar(
                            msg: "Todo must be entered.",
                            snackbarTitle: "Error");
                      } else {
                        controller.addTodo(todoController.text);
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
