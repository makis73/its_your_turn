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
    String jsonOfStudents = json.encode(listOfStudent);
    print(jsonOfStudents);

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

  loadListOfStudents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
  }
}
