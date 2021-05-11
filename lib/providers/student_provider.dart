import 'package:flutter/cupertino.dart';
import 'package:its_your_turn/models/student.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> listOfStudent = [];

  addStudent(Student newStudent) {
    listOfStudent.add(newStudent);
    notifyListeners();
  }

  deleteStudent(int id) {
    listOfStudent.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
