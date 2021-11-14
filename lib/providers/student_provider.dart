import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> listOfStudent = [];

  void updateList(List<Student> listOfStudent) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String jsonOfStudents =
        json.encode(listOfStudent.map((e) => e.toJson()).toList());
    print(jsonOfStudents);
    _prefs.setString('students', jsonOfStudents);
  }

  void addStudent(Student newStudent) async {
    listOfStudent.add(newStudent);
    updateList(listOfStudent);
    notifyListeners();
  }

  void deleteStudent(String id) {
    listOfStudent.removeWhere((element) => element.id == id);
    print('Deleted student with id: $id');
    updateList(listOfStudent);
    notifyListeners();
  }

  void selectRandomStudent() {
    Random random = Random();
    int randomStudent = random.nextInt(listOfStudent.length);
    print('Student: $listOfStudent[$randomStudent]');
    listOfStudent.removeAt(randomStudent);
  }

  // Future<List<Student>> loadListOfStudents() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var listOfStudentString = prefs.getString('students');
  //   if (listOfStudentString != null) {
  //     listOfStudent = jsonDecode(listOfStudentString)['students'];
  //   }
  //   return listOfStudent;
  // }
}
