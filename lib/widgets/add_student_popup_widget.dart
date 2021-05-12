import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:its_your_turn/models/student.dart';
import 'package:its_your_turn/providers/student_provider.dart';
import 'package:provider/provider.dart';
import 'package:nanoid/non_secure.dart';

class AddStudentPopupWidget extends StatefulWidget {
  @override
  _AddStudentPopupWidgetState createState() => _AddStudentPopupWidgetState();
}

class _AddStudentPopupWidgetState extends State<AddStudentPopupWidget> {
  TextEditingController nameController = TextEditingController();
  var _image;
  final picker = ImagePicker();
  bool _photoSelected = false;
  bool _inNameValid = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final studentProvider = Provider.of<StudentProvider>(context);

    Future getImageFromCamera() async {
      final pickedFile = await picker.getImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _photoSelected = true;
        } else {
          print('No image selected');
        }
      });
    }

    Future getImageFromFile() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _photoSelected = true;
        } else {
          print('No image selected');
        }
      });
    }

    _saveNewStudent() {
      var _id = nanoid();
      Student newStudent = Student(
        name: nameController.text,
        id: _id,
        image: (_image != null)
            ? FileImage(_image)
            : Image.asset('assets/images/image.png').image,
      );
      studentProvider.addStudent(newStudent);
      _image = null;
      print(studentProvider.listOfStudent.length);
      Navigator.pop(context);
    }

    return SingleChildScrollView(
      child: AlertDialog(
        //insetPadding: EdgeInsets.all(15),
        content: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: CircleAvatar(
                radius: screenWidth / 9,
                backgroundColor: _image == null ? Colors.green : Colors.grey,
                backgroundImage: (_image != null)
                    ? FileImage(_image)
                    : Image.asset('assets/images/image.png').image,
                child: _photoSelected ? null : Text('Add photo'),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Επιλογή φωτογραφίας"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                                onPressed: () {
                                  getImageFromCamera();
                                  Navigator.pop(context);
                                },
                                child: Text('Λήψη από κάμερα')),
                            TextButton(
                                onPressed: () {
                                  getImageFromFile();
                                  Navigator.pop(context);
                                },
                                child: Text('Ανέβασμα από αρχείο')),
                          ],
                        ),
                      );
                    });
                //await getImageFromCamera();
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Name'),
              onChanged: (value) {
                if (nameController.text.length > 0) {
                  setState(() {
                    _inNameValid = true;
                  });
                }
              },
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
              style: ButtonStyle(),
              onPressed: _inNameValid ? _saveNewStudent : null,
              child: Text('Αποθήκευση'))
        ],
      ),
    );
  }
}
