import 'package:flutter/cupertino.dart';

class Student {
  String id;
  String name;
  ImageProvider? image;
  int timesSelected;

  Student({
    required this.id,
    required this.name,
    this.image,
    this.timesSelected = 0,
  });
}
