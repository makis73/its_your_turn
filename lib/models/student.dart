import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Student {
  late String id;
  late String name;
  late String image;
  late int timesSelected = 0;

  Student({
    required this.id,
    required this.name,
    required this.image,
    this.timesSelected = 0,
  });
  
  void imageConvert() async {
    var cartoonBoy = await 
rootBundle.loadString('assests/images/avatar.png');
var cartoonGirl = await 
rootBundle.loadString('assests/images/image.png');
    
//    ByteData bytes = await rootBundle.load('assets/images/logo_splash.png');
//var buffer = bytes.buffer;
//var m = base64.encode(Uint8List.view(buffer));

  }

  Map toJson() => {
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
