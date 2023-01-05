import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/ViewModel/cart_model.dart';
import 'package:food_delivery/checkout/checkout.dart';
  import 'package:food_delivery/model/cart_product.dart';
import 'package:food_delivery/pages/home/products/product_detail.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/icons_text_widget.dart';
import 'package:food_delivery/widgets/smallText.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          GetBuilder<CartModel>(
            init: Get.put(CartModel()),
            builder:(controller)=>controller.cartProduct.length==0?
                Column(
                  children: [
                    SizedBox(height: Dimensions.pageViewContainer,),
                    SvgPicture.asset('assets/svg/emptyCart.svg',width: 200,height: 200,),
                    SizedBox(height: Dimensions.height20,),
                    mainText(text: 'empty Cart',color: Colors.black54,),
                    SizedBox(height: Dimensions.pageViewCat,),
                  ],
                ):
            Container(
                child:ListView.builder(
                  itemCount: controller.cartProduct.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context,index){
                    return  GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            Container(
                              width:Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(controller.cartProduct[index].image),
                                  )
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.ListViewTextSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(Dimensions.radius20),
                                      bottomRight: Radius.circular(Dimensions.radius20),
                                    ),
                                    color: Colors.white
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:  MainAxisAlignment.center,
                                    children: [
                                      mainText(text:controller.cartProduct[index].name, color: Colors.black,),
                                      SizedBox(height:Dimensions.height10),
                                      smallText(text:  controller.cartProduct[index].price.toString(),color:Color(0xff25982b)),
                                      SizedBox(height:Dimensions.height10),
                                      Container(
                                        padding: EdgeInsets.only(
                                          //left: Dimensions.width10,
                                          right: Dimensions.width20*7.5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              child: AppIcon(icon: Icons.remove,IconSize: Dimensions.iconsize16,backgroundColor: const Color(0xff25982b),iconColor: Colors.white,),
                                              onTap: (){
                                                controller.decreaseQuantity(index);
                                              },
                                            ),
                                            smallText(text:controller.cartProduct[index].quantity.toString(),color: Colors.black),
                                            GestureDetector(child: AppIcon(icon: Icons.add,IconSize: Dimensions.iconsize16,backgroundColor:const Color(0xff25982b),iconColor: Colors.white,),
                                            onTap:(){ controller.increaseQuantity(index);}
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

            ),
          ),

             Container(
              height: Dimensions.bottomHeightSize/1.3,
              padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
              decoration: BoxDecoration(
                  color: const Color(0xfff8fafa),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20*2),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    smallText(text: "Total",color: Colors.black54,size: 22,),
                    GetBuilder<CartModel>(
                      init: Get.find(),
                      builder:(controller)=>Container(


                          child: smallText(text:controller.totalPrice.toString(),color: const Color(0xff25982b),size: 20,)
                      ),
                    ),
                  ],),
                  GestureDetector(
                    onTap:(){Get.to(Checkout()
                    );} ,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: const Color(0xff25982b),
                      ),
                      padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height10,left: Dimensions.width15,right: Dimensions.width15),
                      child: mainText(text:"Check out",color: Colors.white,size: 14,),
                    ),
                  ),
                ],
              ),
          ),
        ],
      );
  }
}
