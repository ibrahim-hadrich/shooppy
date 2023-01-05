import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/cart_model.dart';
import 'package:food_delivery/ViewModel/controller_model.dart';
import 'package:food_delivery/cart.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/model/cart_product.dart';
import 'package:food_delivery/model/product.dart';
import 'package:food_delivery/pages/home/main_market_page.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/icons_text_widget.dart';
import 'package:food_delivery/widgets/introduce_text.dart';
import 'package:food_delivery/widgets/smallText.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  ProductModel productModel;
  ProductDetail({required this.productModel});
 // const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 360,
                decoration: BoxDecoration(
                  image: DecorationImage(
                   fit: BoxFit.contain,
                    image: NetworkImage(productModel.image),
                  )
                ),
              )),
          Positioned(
            top: Dimensions.height45,
            left:Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_bag_outlined),
            ],
          )),
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.heightFoodSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        mainText(text: productModel.name, color: Colors.black,),
                        SizedBox(width: Dimensions.width10,),
                        Wrap(
                          children: List.generate(productModel.rate, (index) => Icon(Icons.star,color: Color(0xff25982b),size: 15,)),
                        ),

                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    mainText(text: "Introduce", color: Colors.black,),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(child: SingleChildScrollView(
                      child:IntroduceText(Text:productModel.description),
                    ))
                  ],
                ),

          )),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightSize/1.2,
        padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
        decoration: BoxDecoration(
          color: const Color(0xfff8f8f8),
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
               left: Dimensions.width20,right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                smallText(text:"Price",color: Colors.grey,size: 20,),
                smallText(text:productModel.price + " TND",color: Color(0xff25982b),size: 18,)
              ],
            ),),
            GetBuilder<CartModel>(
              init: CartModel(),
              builder:(controller)=> GestureDetector(
                onTap: (){
                  Get.to(MainMarketPage());
                  controller.addProduct(CartProduct(name: productModel.name,
                      image: productModel.image,
                      price: productModel.price,
                      productID: productModel.productID,
                      quantity:1)
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: const Color(0xff25982b),
                  ),
                  padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width15,right: Dimensions.width15),
                  child: mainText(text:"Add to cart",color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
