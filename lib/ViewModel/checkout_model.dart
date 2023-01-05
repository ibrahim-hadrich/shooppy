import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/ViewModel/controller_model.dart';
import 'package:food_delivery/ViewModel/home_model.dart';
import 'package:food_delivery/helper/constant.dart';
import 'package:food_delivery/pages/home/main_market_page.dart';
import 'package:food_delivery/pages/home/market_page_body.dart';
import 'package:food_delivery/profil.dart';
import 'package:get/get.dart';

class CheckoutModel extends GetxController{
  int get index=> _index;
  int _index = 0;
  Pages get pages=>_pages;
  Pages _pages = Pages.DeliveryTime;
  String adress1='',adress2='',city='';
  late int codePostal;
  GlobalKey<FormState> formState=GlobalKey();
  void ChangeIndex(int i){
    if (i==1){
      _pages=Pages.AddAddress;
      _index=i;
    }else
      if(i==2){
        formState.currentState?.save();
        _pages=Pages.Summary;
        _index=i;
      }else
      if(i==3)
      {
        Get.to(MainMarketPage());
      }
      update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Color(0xFF89dad0);
    } else {
      return todoColor;
    }
  }
}