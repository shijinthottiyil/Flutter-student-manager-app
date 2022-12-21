import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/db/functions/db_functions.dart';
import 'package:student_app/db/models/data_model.dart';

class ScreenUpdate extends StatefulWidget {
  ScreenUpdate({
    super.key,
    required this.data,
    required this.index,
  });
  final StudentModel data;
  int index;

  @override
  State<ScreenUpdate> createState() => _ScreenUpdateState();
}

class _ScreenUpdateState extends State<ScreenUpdate> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController classnoController = TextEditingController();

  final TextEditingController admController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = widget.data.name;
    ageController.text = widget.data.age;
    classnoController.text = widget.data.class_;
    admController.text = widget.data.adnum;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text('STUDENT DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 5,
          ),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration:  InputDecoration(
                      label: const Text('Name'),
                      hintText: ("Student Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student name is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      label: const Text('Age'),
                      hintText: ("Student Age"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student age is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: classnoController,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      label: const Text('Class'),
                      hintText: ("Enter The Class"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student class is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: admController,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                      label: const Text('admission Number'),
                      hintText: ("Admission Number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student admission number is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                      onPressed: () {
                        updateStudentFunctin();
                      },
                      child: const Text(
                        'Update',
                      )),
                )
              ],
            ),
          ),
        ));
  }

  void updateStudentFunctin() {
    if (formkey.currentState!.validate()) {
      final name = nameController.text.trim();
      final age = ageController.text.trim();
      final classno = classnoController.text.trim();
      final admno = classnoController.text.trim();
      final student = StudentModel(
        name: name,
        age: age,
        class_: classno,
        adnum: admno,
      );
      updateStudent(
        widget.index,
        student,
      );
      Get.back();
      Get.snackbar(
        ' ',
        'student updated succesfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
