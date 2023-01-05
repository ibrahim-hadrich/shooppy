import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/home_model.dart';
import 'package:food_delivery/pages/home/products/product_detail.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/icons_text_widget.dart';
import 'package:food_delivery/widgets/smallText.dart';
import 'package:get/get.dart';

class MarketPageBody extends StatefulWidget {
  const MarketPageBody({Key? key}) : super(key: key);
  @override
  State<MarketPageBody> createState() => _MarketPageBodyState();
}

class _MarketPageBodyState extends State<MarketPageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currentPageValue=0.0;
  var _timer;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPageValue < 4) {
        _currentPageValue++;
      } else {
        _currentPageValue = 0;
      }

      pageController.animateToPage(
        _currentPageValue.toInt(),
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    pageController.addListener(() {
      setState((){
        _currentPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Container(
            height: Dimensions.pageView,
            child:PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context ,position){
                return _buildPageItem(position);
              },
            )
        ),
    SizedBox(height: Dimensions.height15,),
    new DotsIndicator(
    dotsCount: 5,
    position: _currentPageValue,
    decorator: DotsDecorator(
    activeColor: Color(0xff25982b),
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        SizedBox(height: Dimensions.height20,),
        Row(
          children: [
            Container(
              margin:EdgeInsets.only(left:Dimensions.width30),
                  child:mainText(text: "Categories", color: Colors.black,size: 18,),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height20,),
              GetBuilder<HomeModel>(
                init: HomeModel(),
              builder: (controller)=>
              Container(
              height: Dimensions.pageViewCat+50,
              child: ListView.builder(
                itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return Column(
                    children: [
                      Container(
                        height: Dimensions.pageViewCat,
                        width: 190,
                        margin:EdgeInsets.only(left:Dimensions.width30,right: Dimensions.width30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius30),
                          color: Colors.grey.shade100,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(controller.categories[index].image),
                          )
                        ),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      smallText(text: controller.categories[index].name,color: Colors.black54,size: 12,height: 1,)
                    ],
                  );
                  }, ),
          ),
    ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin:EdgeInsets.only(left:Dimensions.width30),
              child:mainText(text: "Best Product", color: Colors.black,size: 18,),
            ),
            Container(
              margin:EdgeInsets.only(right:Dimensions.width30),
              child:mainText(text: "See All", color: Colors.black,size: 18,),
            ),
          ],
        ),



    GetBuilder<HomeModel>(
    builder:(controller)=>
           ListView.builder(
             itemCount: controller.product.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context,index){
                return  GestureDetector(
                  onTap: (){
                    Get.to(ProductDetail(
                      productModel: controller.product[index],
                    ));
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
                                  image: NetworkImage(controller.product[index].image),
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
                                    mainText(text:controller.product[index].name, color: Colors.black,),
                                    SizedBox(height:Dimensions.height10),
                                    smallText(text: controller.product[index].shDesc,),
                                    SizedBox(height:Dimensions.height10),
                                    smallText(text:  controller.product[index].price+" TND",color:Color(0xff25982b)),
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

      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix=new Matrix4.identity();
    if(index==_currentPageValue.floor()){
      var currscale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var currtrans=_height*(1-currscale)/2;
      matrix=Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0,currtrans , 0);
    }else if(index==_currentPageValue.floor()+1){
      var currscale=_scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currtrans=_height*(1-currscale)/2;
      matrix=Matrix4.diagonal3Values(1, currscale, 1);
      matrix=Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0,currtrans , 0);
    }
    else if(index==_currentPageValue.floor()-1){
      var currscale=1-(_currentPageValue-index)*(1-_scaleFactor);
      var currtrans=_height*(1-currscale)/2;
      matrix=Matrix4.diagonal3Values(1, currscale, 1);
      matrix=Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0,currtrans , 0);
    }
    else{
      var currscale=0.8;
      matrix=Matrix4.diagonal3Values(1, currscale, 1)..setTranslationRaw(0,_height*(1-currscale)/2 , 1);

    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: Color(0xff25982b),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/ads.jpg")
            )
        ),
      ),
        ],
      ),
    );
  }
}
