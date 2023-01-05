import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/progress_bar.dart';
import 'package:food_delivery/widgets/smallText.dart';

class LoadingDialogue extends StatelessWidget {
  final String? message;
  LoadingDialogue({this.message});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key:key,
      content:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          SizedBox(height: Dimensions.height10,),
          smallText(text: "please wait...")
        ],
      ) ,

    );
  }
}
