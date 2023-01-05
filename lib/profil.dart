import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/smallText.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {


  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [

       Container(
     // padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.width15),
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Container(
    height: 90,
    width: 90,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(100)),
    image: DecorationImage(
    image:
    NetworkImage(sharedPreferences!.getString('picurl')!),
    ),
    ),

     // child: mainText(text:sharedPreferences!.getString('name')!,color: Colors.black54,),
    ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          mainText(text: sharedPreferences!.getString('name')!,color: Colors.black54,size: 19,),
          SizedBox(height: Dimensions.height10,),
          mainText(text: sharedPreferences!.getString('email')!,color: Colors.black54,size: 15,),
        ],
      )
    ],
    ),
    ),
      SizedBox(height: Dimensions.height45,),
      Container(
        padding: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width20),
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: smallText(text: 'Edit Profile',color: Colors.black54,),
            leading: Icon(Icons.edit),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ),
      SizedBox(height: Dimensions.height20,),
      Container(
        padding: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width20),
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: smallText(text: 'Shipping Adress',color: Colors.black54,),
            leading: Icon(Icons.location_on),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ),
      SizedBox(height: Dimensions.height20,),
      Container(
        padding: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width20),
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: smallText(text: 'Order History',color: Colors.black54,),
            leading: Icon(Icons.watch_later_outlined),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ),
      SizedBox(height: Dimensions.height20,),
      Container(
        padding: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width20),
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: smallText(text: 'Cards',color: Colors.black54,),
            leading: Icon(Icons.wallet),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ),
      SizedBox(height: Dimensions.height20,),
      Container(
        padding: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width20),
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: smallText(text: 'Notifications',color: Colors.black54,),
            leading: Icon(Icons.notifications),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ),
      SizedBox(height: Dimensions.height20,),
      Container(
        padding: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width20),
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: smallText(text: 'Log Out',color: Colors.black54,),
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      ),

    ],
    ),
    ),
    ),

        ],
      );


  }
}
