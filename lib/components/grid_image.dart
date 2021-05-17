import 'dart:ui';

import 'package:flutter/material.dart';

class GridImage extends StatelessWidget {
  String image;
  String description;

  GridImage({@required this.image, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            description,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.deepPurple,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]
    );
  }
}
