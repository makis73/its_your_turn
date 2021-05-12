import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:its_your_turn/providers/student_provider.dart';
import 'package:provider/provider.dart';

class AddStudentPopupWidget extends StatefulWidget {
  @override
  _AddStudentPopupWidgetState createState() => _AddStudentPopupWidgetState();
}

class _AddStudentPopupWidgetState extends State<AddStudentPopupWidget> {
  TextEditingController nameController = TextEditingController();
var _image;
    final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final studentProvider = Provider.of<StudentProvider>(context);

    

    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          print(_image?.path);
          print(_image == null);
        } else {
          print('No image selected');
        }
      });
    }

    return AlertDialog(
      //insetPadding: EdgeInsets.all(15),
      content: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: CircleAvatar(
              radius: screenWidth / 9,
              backgroundColor: _image == null ? Colors.green : Colors.grey,
              backgroundImage: (_image != null) ? FileImage(_image) : Image.asset('assets/images/image.png').image,
              child: Text('Add photo'),
            ),
            onTap: () async {
              await getImage();
            },
          ),
          SizedBox(height: 20),
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Name'),
            //onSubmitted: ,
          ), 
          //Image(image: _image != null ? FileImage(_image) : AssetImage('assets/images/image.png'))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ακύρωση')),
        TextButton(
            onPressed: () {
              Student newStudent = Student(
                  name: nameController.text,
                  id: studentProvider.listOfStudent.length + 1,
                  image: FileImage(_image));
              studentProvider.addStudent(newStudent);
              print(studentProvider.listOfStudent.length);
              Navigator.pop(context);
            },
            child: Text('Αποθήκευση'))
      ],
    );
  }
}
