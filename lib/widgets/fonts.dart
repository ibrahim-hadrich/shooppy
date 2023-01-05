import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class mainText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  mainText({Key? key,this.color=const Color(0x00029ec5FF),required this.text,
  this.overflow=TextOverflow.ellipsis,
  this.size=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      maxLines: 2,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize:size==0?Dimensions.font20:size
      ),
    );
  }
}
