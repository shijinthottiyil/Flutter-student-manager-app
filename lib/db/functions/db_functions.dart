import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app/db/models/data_model.dart';

ValueNotifier<List<StudentModel>> studentdataNotifier = ValueNotifier([]);
void addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  studentdataNotifier.value.add(value);
  studentdataNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentdataNotifier.value.clear();
  studentdataNotifier.value.addAll(studentDB.values);
  studentdataNotifier.notifyListeners();
}

Future<void> deleteStudent(int index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.deleteAt(index);
  getAllStudents();
}

Future<void> updateStudent(int index, StudentModel model) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.putAt(index, model);
  await getAllStudents();
}
