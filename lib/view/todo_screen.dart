import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/model/todo.dart';
import 'package:getx_sample/view/add_todo_screen.dart';
import 'package:getx_sample/view/update_todo_screen.dart';
import 'package:getx_sample/viewmodel/todo_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoScreen extends GetView<TodoViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2efe6),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Todo',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () async {
                  var result=await Get.to(AddTodoScreen());
                  if(result){
                    controller.getTodo();
                  }
                },
                child: const Icon(
                  Icons.add,
                  size: 35,
                )),
          )
        ],
      ),
      body: Obx(() {
        return controller.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.todoList.length,
                itemBuilder: (context, index) {
                  Todo todo = controller.todoList[index];
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) {
                            Get.defaultDialog(
                              titleStyle: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              contentPadding: const EdgeInsets.all(20),
                              title: 'Delete',
                              content: Text(
                                "Are you sure want to delete?",
                                style: GoogleFonts.poppins(
                                    textStyle:const TextStyle(fontSize: 20)),
                              ),
                              textConfirm: 'Delete',
                              confirmTextColor: Colors.white,
                              radius: 5,
                              textCancel: 'Cancel',
                              cancelTextColor: Colors.red,
                              buttonColor: Colors.red,
                              onConfirm: (){
                                Get.back();
                                controller.deleteTodo(todo.id!, index);
                              }
                            );
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) async {
                            var result=await Get.to(UpdateTodoScreen(),arguments: todo);
                            if(result){
                              controller.getTodo();
                            }
                          },
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      ],
                    ),
                    child: Card(
                      color: const Color(0xfff7957c),
                      margin: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  controller.updateStatus(
                                      !todo.completed!, todo.id!, index);
                                },
                                child: Icon(
                                  Icons.circle,
                                  color: todo.completed!
                                      ? Colors.green
                                      : Colors.white,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                todo.description!,
                                style: GoogleFonts.cabin(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
      }),
    );
  }
}
