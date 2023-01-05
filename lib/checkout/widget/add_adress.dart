
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/checkout_model.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/text_input_field.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAddress extends StatefulWidget {

  @override
  _AddAddress createState()=> _AddAddress();
}

class _AddAddress extends State<AddAddress> {
  TextEditingController Adress1Controller=TextEditingController();
  TextEditingController Adress2Controller=TextEditingController();
  TextEditingController PostalCodeController=TextEditingController();
  TextEditingController CityController=TextEditingController();
  Future readDataAndSetLocaly()async{
    sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences!.setString("adress1", Adress1Controller.text.trim());
    await sharedPreferences!.setString("adress2", Adress2Controller.text.trim());
    await sharedPreferences!.setString("postalCode", PostalCodeController.text.trim());
    await sharedPreferences!.setString("city", CityController.text.trim());
  }
  @override
  void initState() {
    readDataAndSetLocaly();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutModel>(
      init: CheckoutModel(),
      builder:(controller)=> Form(
        key: controller.formState,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(height: Dimensions.height10,),
                Container(
                  padding: EdgeInsets.all(20),
                    child: mainText(text: 'Billing adress is the same as delivery adress',size: 20,color: Colors.black54,)),
                SizedBox(height: Dimensions.height45,),
                TextInputField(
                  icon: Icons.location_on,
                  hint: 'Adress Line 1 ',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  controller: Adress1Controller,
                ),
                SizedBox(height: Dimensions.height20,),
                TextInputField(

                  icon: Icons.location_on,
                  hint: 'Adress Line 2 ',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  controller:Adress2Controller ,
                ),
                SizedBox(height: Dimensions.height20,),
                TextInputField(

                  icon: Icons.post_add,
                  hint: 'Postal Code ',
                  inputType: TextInputType.number,
                  inputAction: TextInputAction.next,
                  controller:PostalCodeController ,
                ),
                SizedBox(height: Dimensions.height20,),
                TextInputField(

                  icon: Icons.location_city,
                  hint: 'City ',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  controller:CityController ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}