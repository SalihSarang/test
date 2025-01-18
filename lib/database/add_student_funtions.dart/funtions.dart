import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/database/model.dart';

final ValueNotifier<List<MyDatabase>> studentlistener = ValueNotifier([]);
const STUDENT_BOX = "students";

Future<void> addstudent(MyDatabase value) async {
  var box = Hive.box<MyDatabase>(STUDENT_BOX);
  await box.put(value.studentId, value);
  getAllStudent();
}

getAllStudent() {
  studentlistener.value.clear();
  var box = Hive.box<MyDatabase>(STUDENT_BOX);
  studentlistener.value.addAll(box.values);
  studentlistener.notifyListeners();
}
