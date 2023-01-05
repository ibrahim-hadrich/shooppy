import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/cart_model.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/smallText.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartModel>(
        builder:(controller)=> Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           SizedBox(height: Dimensions.height10,),
            Container(
              height: Dimensions.pageViewContainer,
              padding: EdgeInsets.all(20),
              child: ListView.separated(itemBuilder:(context, index)=>
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(controller.cartProduct[index].image),
                              )
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:  MainAxisAlignment.center,
                            children: [
                              mainText(text:controller.cartProduct[index].name, color: Colors.black,),
                              SizedBox(height:Dimensions.height10),
                              smallText(text:  controller.cartProduct[index].price,color:Color(0xFF89dad0)),
                            ],
                          ),
                        ),

                      ],
                    ),
              ),
                itemCount: controller.cartProduct.length,
                separatorBuilder: (context,index){
                return SizedBox(width: Dimensions.height10,);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            mainText(text: sharedPreferences!.getString('adress1')!,color: Colors.black54,)
          ],
        ),
      ),
    );
  }
}