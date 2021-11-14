import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:its_your_turn/providers/student_provider.dart';
import 'package:its_your_turn/widgets/%20add_student_avatar.dart';
import 'package:its_your_turn/widgets/student_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MaterialApp(
        title: 'Its your turn',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 65, 40, 1),
        ),
        home: MyHomePage(title: 'Its your turn'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List> _savedListOfStudents;

//  Future<List<Student>> loadListOfStudents() async {
//    var listOfStudent;
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var listOfStudentString =  prefs.getString('students');
//    if (listOfStudentString != null) {
//      listOfStudent = jsonDecode(listOfStudentString);
//    }
//    return listOfStudent;
//  }
//
  @override
  void initState() {
    //loadListOfStudents();

    _savedListOfStudents = _prefs.then((value) {
      var listOfStudentString = value.getString('students');
      print(listOfStudentString);

      var listOfStudent = jsonDecode(listOfStudentString!);
      print(listOfStudent);
      return listOfStudent;
    });
    //loadListOfStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    print(studentProvider.listOfStudent);
    studentProvider.listOfStudent
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Object>(
          future: _savedListOfStudents,
          builder: (context,AsyncSnapshot snapshot) {
            print('From Build${snapshot.data}');
            var listOfStudents = snapshot.data;
            return GridView.count(
              padding: EdgeInsets.all(18),
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                ...listOfStudents.map((student) => StudentWidget(
                      student: student,
                    )),
                AddStudentAvatar()
              ],
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.next_plan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
