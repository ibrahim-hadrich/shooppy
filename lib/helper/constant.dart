import 'package:flutter/material.dart';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}
enum Delivery{
  StandardDelivery,
  NextDayDelivery,
  CustomizeDelivery
}