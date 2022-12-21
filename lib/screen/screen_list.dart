import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/db/models/data_model.dart';
import 'package:student_app/screen/screen_update.dart';

import '../db/functions/db_functions.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentdataNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentList[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScreenUpdate(
                                data: data,
                                index: index,
                              )));
                },
                title: Text(data.name.toUpperCase()),
                trailing: IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Delete',
                        content: const Text(
                          'Are you sure you want to delete this item.',
                        ),
                        onCancel: () => Get.back(),
                        onConfirm: () {
                          deleteStudent(index);
                          Get.back();
                        },
                        confirmTextColor: Colors.black,
                        cancelTextColor: Colors.black,
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('lib/asset/brototype.jpeg'),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
    );
  }
}
