import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/image.png'),
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
              'Θάνος',
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
                '10',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
