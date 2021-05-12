import 'package:flutter/material.dart';
import 'package:its_your_turn/models/student.dart';

class StudentWidget extends StatelessWidget {
  final Student student;

  StudentWidget({
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: student.image,
            backgroundColor: Theme.of(context).primaryColor,
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
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
