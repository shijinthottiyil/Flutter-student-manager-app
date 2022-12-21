import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/db/functions/db_functions.dart';
import 'package:student_app/db/models/data_model.dart';


class ScreenInput extends StatelessWidget {
  ScreenInput({super.key});
  final _stdnameController = TextEditingController();
  final _stdageController = TextEditingController();
  final _classController = TextEditingController();
  final _admissionController = TextEditingController();
  String imageAdd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Add Student Details',
          style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 56,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            
           
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _stdnameController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hintText: ("Student Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _stdageController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.date_range_rounded,
                      color: Colors.black,
                    ),
                    hintText: ("Student Age"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _classController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.account_balance,
                      color: Colors.black,
                    ),
                    hintText: ("Enter The Class"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _admissionController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.adf_scanner,
                      color: Colors.black,
                    ),
                    hintText: ("Admission Number"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  addStudentButtonClicked(context);
                },
                icon: const Icon(Icons.save),
                label: const Text('SAVE'),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }

  addStudentButtonClicked(BuildContext context) async {
    final _name = _stdnameController.text.trim();
    final _age = _stdageController.text.trim();
    final _class = _classController.text.trim();
    final _adnum = _admissionController.text.trim();
    if (_name.isEmpty || _age.isEmpty || _class.isEmpty || _adnum.isEmpty) {
      return Get.snackbar('Warning', "All field is required",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      //print('$_name $_age $_class $_adnum');
      _stdnameController.clear();
      _stdageController.clear();
      _classController.clear();
      _admissionController.clear();
      final _student =
          StudentModel(name: _name, age: _age, class_: _class, adnum: _adnum);
      addStudent(_student);
      Get.back();
      Get.snackbar(' ', "Student detail added successfully",
          snackPosition: SnackPosition.BOTTOM);
      // Navigator.of(context).pop();
    }
  }

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      final imageTemporary = File(image.path).readAsBytesSync();

      imageAdd = base64Encode(imageTemporary);
    }
  }
  //setstate
}































// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_sample/db/functions/db_functions.dart';
// import 'package:hive_sample/db/models/data_model.dart';
// import 'package:hive_sample/screen/screen_list.dart';

// class ScreenInput extends StatelessWidget {
//   ScreenInput({super.key});
//   final _stdnameController = TextEditingController();
//   final _stdageController = TextEditingController();
//   final _classController = TextEditingController();
//   final _admissionController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: [
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _stdnameController,
//           decoration: const InputDecoration(
//               hintText: ("Student Name"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _stdageController,
//           decoration: const InputDecoration(
//               hintText: ("Student Age"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _classController,
//           decoration: const InputDecoration(
//               hintText: ("Enter The Class"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _admissionController,
//           decoration: const InputDecoration(
//               hintText: ("Admission Number"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         ElevatedButton.icon(
//           onPressed: () {
//             addStudentButtonClicked();
//           },
//           icon: const Icon(Icons.save),
//           label: const Text('SAVE'),
//         ),
//         TextButton.icon(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: const Icon(Icons.skip_previous),
//           label: const Text('Back'),
//           style: TextButton.styleFrom(
//             foregroundColor: Colors.black,
//           ),
//         )
//       ],
//     ));
//   }
// }

// Future<void> addStudentButtonClicked() async {
//   // final _name = _std
//   // final _age = _stdageController.text.trim();
//   // final _class = _classController.text.trim();
//   // final _adnum = _admissionController.text.trim();
// final _name = _std
//   if (_name.isEmpty || _age.isEmpty || _class.isEmpty || _adnum.isEmpty) {
//     return;
//   } else {
//     //print('$_name $_age $_class $_adnum');
//     final _student =
//         StudentModel(name: _name, age: _age, class_: _class, adnum: _adnum);
//     addStudent(_student);
//   }
// }
