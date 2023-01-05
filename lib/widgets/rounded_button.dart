import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueAccent,
      ),
      child: TextButton(
        onPressed: () {
        },
        child: Text(
          buttonName,
          style: TextStyle(color: Colors.white),
          //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}