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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'timesSelected': timesSelected,
      };

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    timesSelected = json['timesSelected'];
  }
}
