import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/login/forgot_password.dart';
import 'package:food_delivery/login/register_screen.dart';
import 'package:food_delivery/pages/home/main_market_page.dart';
import 'package:food_delivery/widgets/Password_input.dart';
import 'package:food_delivery/widgets/alert_dialogue.dart';
import 'package:food_delivery/widgets/background_image.dart';
import 'package:food_delivery/widgets/loading_dialogue.dart';
import 'package:food_delivery/widgets/rounded_button.dart';
import 'package:food_delivery/widgets/text_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  formValidation(){
    if(emailController.text.isNotEmpty&&passwordController.text.isNotEmpty){
      loginNow();
    }else{
      showDialog(context: context,
          builder: (c) {
            return ErrorDialogue(
              message: "please write your email and password",
            );
          }
      );
    }
  }
  loginNow() async{
    showDialog(context: context,
        builder: (c) {
          return LoadingDialogue(
            message: "please wait ...",
          );
        }
    );
    User? currenUser;
    await firebaseAuth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim()).then((auth){
     currenUser= auth.user!;
    })    .catchError((err) {
      Navigator.pop(context);
      showDialog(context: context,
          builder: (c){
            return ErrorDialogue(
              message: err.toString(),
            );
          }
      );
    });
    if (currenUser!=null){
      readDataAndSetLocaly(currenUser!).then((value){
        Navigator.pop(context);
        Get.to(MainMarketPage());
      });
    }
  }
  Future readDataAndSetLocaly(User currentUser)async{
  FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get().then((snapshot) async{
    sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences!.setString("email", emailController.text.trim());
    await sharedPreferences!.setString("name", snapshot.data()!["userName"]);
    await sharedPreferences!.setString("picurl", snapshot.data()!["userAvatarUrl"]);
  });
  }
  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          BackgroundImage(image: 'assets/image/farmerbg.jpg'),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Flexible(
                  child: Center(
                    heightFactor: 7,
                    child: Text(
                      'Shoppy.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInputField(
                      icon: Icons.mail,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      controller: emailController,
                    ),
                    PasswordInput(
                      icon: Icons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                      controller: passwordController,
                    ),
                    GestureDetector(
                      onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (c)=>ForgotPassword())),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child:TextButton(
                        onPressed: () {
                          formValidation();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                          //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                   /* GestureDetector(
                      onTap: (){
                        formValidation();
                      },
                      child: RoundedButton(
                        buttonName: 'Login',
                      ),
                    ),*/
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c)=>RegistrationPage())),
                  child: Container(
                    child: Text(
                      'Create New Account',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        border:
                        Border(bottom: BorderSide(width: 1, color: Colors.white))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      );
    }
  }
