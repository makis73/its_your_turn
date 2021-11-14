import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> listOfStudent = [];

  addStudent(Student newStudent) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    listOfStudent.add(newStudent);
    String jsonOfStudents =
        json.encode(listOfStudent.map((e) => e.toJson()).toList());
    print(jsonOfStudents);
    prefs.setString('students', jsonOfStudents);

    notifyListeners();
  }

  deleteStudent(String id) {
    listOfStudent.removeWhere((element) => element.id == id);
    print('Deleted student with id: $id');
    notifyListeners();
  }

  selectRandomStudent() {
    Random random = Random();
    int randomStudent = random.nextInt(listOfStudent.length);
    print('Student: $listOfStudent[$randomStudent]');
    listOfStudent.removeAt(randomStudent);
  }

  Future<List<Student>> loadListOfStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var listOfStudentString = prefs.getString('students');
    if (listOfStudentString != null) {
      listOfStudent = jsonDecode(listOfStudentString)['students'];
    }
    return listOfStudent;
  }
}
