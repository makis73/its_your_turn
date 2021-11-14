import 'package:flutter/material.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:its_your_turn/providers/student_provider.dart';
import 'package:provider/provider.dart';

class StudentWidget extends StatelessWidget {
  final Student student;

  StudentWidget({
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final studentProvider = Provider.of<StudentProvider>(context);

    _showDeleteDialog() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Διαγραφή Μαθητή'),
                content: Text(
                    'Είσαι σίγουρος οτι θέλεις να διαγράψεις τον μαθητή ${student.name};'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Όχι')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        studentProvider.deleteStudent(student.id);
                      },
                      child: Text('Ναι'))
                ],
              ));
    }

    _onLongPressDialog() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {
                        
                        Navigator.pop(context);
                      },
                      child: Text('Επεξεργασία μαθητή')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showDeleteDialog();
                      },
                      child: Text('Διαγραφή μαθητή')),
                ],
              ),
            );
          });
    }

    return InkWell(
      onTap: () {
        print('ID: ${student.id}');
      },
      onLongPress: _onLongPressDialog,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: AssetImage(student.image),
              backgroundColor: Colors.white,
              radius: screenWidth / 5,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(2),
              child: FittedBox(
                  child: Text(
                student.name,
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
              top: -2,
              left: -2,
              child: Container(
                width: screenWidth / 20,
                height: screenWidth / 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
