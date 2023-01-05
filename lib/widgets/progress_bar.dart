
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

circularProgress(){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: Dimensions.height10),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        const Color(0xFF89dad0)
      ),
    ),
  );
}