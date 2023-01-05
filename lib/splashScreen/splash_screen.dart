import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/cart_model.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/login/login_screen.dart';
import 'package:food_delivery/login/register_screen.dart';
import 'package:food_delivery/pages/home/main_market_page.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  startTimer(){
    _isVisible = true;
    Timer(const Duration(seconds: 8),() async
    {
      if(firebaseAuth.currentUser!=null){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>MainMarketPage()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
      }
    });
  }
  @override
  void initState() {
    super.initState();
    Get.put(CartModel());
    startTimer();
  }
  @override
  Widget build(BuildContext context) {

    return Container(

          color:  Color(0xff25982b),

      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
              child: ClipOval(
                child: Image.asset('assets/image/farmersplash.png'),
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
