import 'package:flutter/material.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:its_your_turn/providers/student_provider.dart';
import 'package:its_your_turn/widgets/add_student_popup_widget.dart';
import 'package:provider/provider.dart';

class AddStudentAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (_) => AddStudentPopupWidget());
      },
      child: CircleAvatar(
        child: Icon(
          Icons.add,
          size: screenWidth / 10,
        ),
        backgroundColor: Colors.grey,
        radius: screenWidth / 5,
      ),
    );
  }
}
