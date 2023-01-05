import 'package:flutter/material.dart';
import 'package:food_delivery/helper/constant.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:food_delivery/widgets/smallText.dart';

class DeliveryTime extends StatelessWidget {
  Delivery delivery=Delivery.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45,),
          RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              onChanged: (Delivery ?value){},
            title: mainText(text: "Standard Delivery"),
            subtitle: smallText(text: "Order will be delivered between 3-5 days"),
            activeColor: Color(0xFF89dad0),
          ),
          SizedBox(height: Dimensions.height20,),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery ?value){},
            title: mainText(text: "Next Day Delivery"),
            subtitle: smallText(text: " Place your order before 6pm and your order will be delivered the next day"),
            activeColor: Color(0xFF89dad0),
          ),
          SizedBox(height: Dimensions.height20,),
          RadioListTile<Delivery>(
            value: Delivery.CustomizeDelivery,
            groupValue: delivery,
            onChanged: (Delivery ?value){},
            title: mainText(text: "Customize your Delivery"),
            subtitle: smallText(text: " Pick a particular date from the calendar and your order will be delivered on selected date"),
            activeColor: Color(0xFF89dad0),
          ),
        ],
      ),
    );
  }
}