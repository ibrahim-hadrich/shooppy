import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/model/user.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  FirebaseAuth _auth= FirebaseAuth.instance;

}