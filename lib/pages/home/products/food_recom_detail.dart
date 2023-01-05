import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/introduce_text.dart';
import 'package:get/get.dart';

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder:(controller)=> Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
          title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            AppIcon(icon: Icons.clear,IconSize: Dimensions.iconsize24,),
            AppIcon(icon: Icons.shopping_bag_outlined,IconSize: Dimensions.iconsize24,),
            ],
         ),
          pinned: true,
              backgroundColor:Colors.orangeAccent,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/image/food01.jpg",width: double.maxFinite,fit: BoxFit.cover,),
              ) ,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                 // color: Colors.white,
                  child:Center(child: mainText(text:"Sliver AppBar",color: Colors.black,size: Dimensions.font16,)),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child:IntroduceText(Text: "bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla blabla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla"),
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),

                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.remove,IconSize: Dimensions.iconsize24,backgroundColor: const Color(0xff25982b),iconColor: Colors.white,),
                  mainText(text: "12TND"+" X "+" 0 ",color: Colors.black,size: Dimensions.font20,),
                  AppIcon(icon: Icons.add,IconSize: Dimensions.iconsize24,backgroundColor:const Color(0xff25982b),iconColor: Colors.white,)
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightSize,
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20*2),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                        color: const Color(0xff25982b),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: const Color(0xff25982b),

                    ),
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    child: mainText(text: "10TND | Add to cart",color: Colors.white,),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
