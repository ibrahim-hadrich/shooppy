import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/controller_model.dart';
import 'package:food_delivery/cart.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/login/login_screen.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/smallText.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class MainMarketPage extends StatefulWidget {
  const MainMarketPage({Key? key}) : super(key: key);

  @override
  _MainMarketPageState createState()=> _MainMarketPageState();
}

class _MainMarketPageState extends State<MainMarketPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerModel>(
        init:Get.put(ControllerModel()),
        builder: (controller)=>
       Scaffold(
        body: Column(
          children: [
           Container(
              child:Container(
                margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap:(){

                        },
                        child: mainText(
                            text: "Tunisia",color: Color(0xff25982b),),
                      ),

                      Row(
                        children: [
                          smallText(text: "Sfax"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height:Dimensions.height45,
                        width: Dimensions.height45,
                        child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconsize16,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color:Color(0xff25982b),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height:Dimensions.height45,
                        width: Dimensions.height45,

                        child: GestureDetector(
                            onTap:(){
                              firebaseAuth.signOut();
                              Get.to(LoginScreen());
                            },
                            child: Icon(Icons.logout,color: Colors.white,size: Dimensions.iconsize16,)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color:Color(0xff25982b),
                        ),
                      ),
                    ],

                  ),

                ],

              ),
            )
            ),

              GetBuilder<ControllerModel>(
                builder: (controller)=>(
                 Expanded(
                    child:SingleChildScrollView(
                    child:controller.currentScreen,
                )
                 )),
            ),
            //FoodDetail(),
          ],
        ),
        bottomNavigationBar: GetBuilder<ControllerModel>(
          init: ControllerModel(),
          builder: (controller)=>BottomNavigationBar(
            items: [
              BottomNavigationBarItem(activeIcon: Padding(
                padding:  EdgeInsets.only(top:Dimensions.height20),
                child: smallText(text:'Home'),
              ), icon: Padding(
                padding:  EdgeInsets.only(top:Dimensions.height15),
                child: Image.asset('assets/image/home.png',fit: BoxFit.contain,width: Dimensions.iconsize24,color: const Color(0xff25982b)),
              ),label: ''),
              BottomNavigationBarItem(activeIcon: Padding(
                padding: EdgeInsets.only(top:Dimensions.height20),
                child: smallText(text:'Cart',),
              ), icon: Padding(
                padding:  EdgeInsets.only(top:Dimensions.height15),
                child: Image.asset('assets/image/cart.png',fit: BoxFit.contain,width: Dimensions.iconsize24,color: const Color(0xff25982b)),
              ),label: ''),
              BottomNavigationBarItem(activeIcon: Padding(
                padding:  EdgeInsets.only(top:Dimensions.height20),
                child: smallText(text:'Profile'),
              ), icon: Padding(
                padding:  EdgeInsets.only(top: Dimensions.height15),
                child: Image.asset('assets/image/user.png',fit: BoxFit.contain,width: Dimensions.iconsize24,color: const Color(0xff25982b),),
              ),label: ''),
            ],
            currentIndex: controller.navigatorValue,
            onTap: (index)
            {
              controller.changeSelectedValue(index);

              },
          ),
        ),
      ),
    );
  }
}
