import 'package:flutter/cupertino.dart';
import 'package:food_delivery/cart.dart';
import 'package:food_delivery/pages/home/market_page_body.dart';
import 'package:food_delivery/profil.dart';
import 'package:get/get.dart';

class ControllerModel extends GetxController{
int _navigatorValue=0;
Widget _currentScreen=MarketPageBody();
get currentScreen=>_currentScreen;

get navigatorValue=>_navigatorValue;
void changeSelectedValue(int selectedValue){
  _navigatorValue=selectedValue;
  switch(selectedValue){
    case 0:{
      _currentScreen=MarketPageBody();
      break;
    }
    case 1:{
      _currentScreen=Cart();
      break;
    }
    case 2:{
      _currentScreen=Profile();
      break;
    }
  }
  update();
}
}