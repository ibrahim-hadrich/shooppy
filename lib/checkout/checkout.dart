import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ViewModel/checkout_model.dart';
import 'package:food_delivery/ViewModel/home_model.dart';
import 'package:food_delivery/checkout/widget/add_adress.dart';
import 'package:food_delivery/checkout/widget/delevery_time.dart';
import 'package:food_delivery/checkout/widget/summary.dart';
import 'package:food_delivery/helper/constant.dart';
import 'package:food_delivery/pages/home/market_page_body.dart';
import 'package:food_delivery/profil.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/fonts.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class Checkout extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutModel>(
      init: CheckoutModel(),
      builder:(controller)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
               Container(
                 height: Dimensions.pageViewContainer,
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme:
                    ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                    MediaQuery.of(context).size.width / _processes.length,
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.getColor(index),
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Color(0xff25982b), width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff25982b),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          final color = controller.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
                controller.pages==Pages.DeliveryTime?DeliveryTime():controller.pages==Pages.AddAddress?AddAddress():Summary(),
            InkWell(
              onTap: (){
                controller.ChangeIndex(controller.index+1);
              },
              child:Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: 200,
                  height: 100,
                  child: mainText(text: 'Next'),
                ),
              ) ,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.skip_next),
          onPressed: () {
            print(controller.index);
              controller.ChangeIndex(controller.index+1);
          },
          backgroundColor: inProgressColor,
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Adress',
  'Summer ',
];

