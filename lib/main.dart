import 'package:flutter/material.dart';
import 'package:its_your_turn/providers/student_provider.dart';
import 'package:its_your_turn/widgets/%20add_student_avatar.dart';
import 'package:its_your_turn/widgets/student_widget.dart';
import 'package:provider/provider.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(18),
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [StudentWidget(),StudentWidget(),StudentWidget(),StudentWidget(),StudentWidget(),StudentWidget(), AddStudentAvatar() ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.next_plan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
