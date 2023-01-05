import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

 SharedPreferences ?sharedPreferences;
FirebaseAuth firebaseAuth=FirebaseAuth.instance;
final String tableCartProduct='cartProduct';
final String columnName='name';
final String columnImage='image';
final String columnQuantity='quantity';
final String columnPrice='price';
final String columnProductId='productID';
