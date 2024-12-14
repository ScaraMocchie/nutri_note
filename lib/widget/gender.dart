import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final double size;
  final String imagePath;
  final Color initialColor;
  final Color onClickColor;

  const Gender({
    Key? key,
    required this.size,
    required this.imagePath,
    this.initialColor = Colors.white,
    this.onClickColor = Colors.orange,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: onClickColor,
            shape: BoxShape.circle,
          ),
        ),
        ClipOval(
          child: Image.asset(
            imagePath,
            width: size*0.9,
            height: size*0.9,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}