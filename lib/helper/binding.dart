
import 'package:food_delivery/ViewModel/cart_model.dart';
import 'package:food_delivery/ViewModel/checkout_model.dart';
import 'package:food_delivery/ViewModel/controller_model.dart';
import 'package:food_delivery/ViewModel/home_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  void dependencies(){
    Get.lazyPut(() => ControllerModel());
    Get.lazyPut(() => HomeModel());
    Get.lazyPut(() => CartModel());
    Get.lazyPut(() => CheckoutModel());

  }
}