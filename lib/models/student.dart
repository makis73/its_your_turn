import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Student {
  int id;
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
