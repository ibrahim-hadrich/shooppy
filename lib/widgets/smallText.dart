import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class smallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  smallText({Key? key,this.color=Colors.grey,required this.text,
    this.size=12,
  this.height=1.2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
        height: height
      ),
    );
  }
}
