import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/global/global.dart';
import 'package:food_delivery/login/login_screen.dart';
import 'package:food_delivery/pages/home/main_market_page.dart';
import 'package:food_delivery/widgets/Password_input.dart';
import 'package:food_delivery/widgets/alert_dialogue.dart';
import 'package:food_delivery/widgets/background_image.dart';
import 'package:food_delivery/widgets/loading_dialogue.dart';
import 'package:food_delivery/widgets/rounded_button.dart';
import 'package:food_delivery/widgets/text_input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  XFile ?imageXFile;
  String userImageUrl="";
  final ImagePicker _picker=ImagePicker();
  Future<void>_getImage()async{
    imageXFile=await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }
  Future<void>formValidation()async{
    if(passwordController.text==confirmController.text) {

      if (confirmController.text.isNotEmpty && emailController.text.isNotEmpty && nameController.text.isNotEmpty) {
        LoadingDialogue();
        String fileName=DateTime.now().millisecondsSinceEpoch.toString();
        fstorage.Reference reference = fstorage.FirebaseStorage.instance.ref().child("user").child(fileName);
        fstorage.UploadTask uploadTask = reference.putFile(File(imageXFile!.path));
        fstorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete((){});
        await taskSnapshot.ref.getDownloadURL().then((url){
          userImageUrl=url;
          signUpAndAuthUser();
        });

      }else {
        showDialog(context: context,
            builder: (c) {
              return ErrorDialogue(
                message: "please complete the required info",
              );
            }
        );
      }
    }else{
      showDialog(context: context,
          builder: (c){
            return ErrorDialogue(
              message: "password do not match",
            );
          }
      );
    }
    }
    void signUpAndAuthUser() async
    {
    User? currentUser;

    await firebaseAuth.createUserWithEmailAndPassword(
        email:emailController.text.trim() ,
        password: passwordController.text.trim(),
    ).then((auth){
      currentUser=auth.user;
    })
        .catchError((err) {
      Navigator.pop(context);
      showDialog(context: context,
          builder: (c){
            return ErrorDialogue(
              message: err.toString(),
            );
          }
      );
    });
    if(currentUser!=null){
      saveDataToFirestore(currentUser!).then((value){
        Navigator.pop(context);
        Get.to(MainMarketPage());
      });
    }
    }
    Future saveDataToFirestore(User currentUser) async{
    FirebaseFirestore.instance.collection('users').doc(currentUser.uid).set({
      "userUID":currentUser.uid,
      "userEmail":currentUser.email,
      "userName":nameController.text.trim(),
      'userAvatarUrl':userImageUrl
    });
    sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences!.setString('uid', currentUser.uid);
    await sharedPreferences!.setString('name', nameController.text.trim());
    await sharedPreferences!.setString('email', emailController.text.trim());
    await sharedPreferences!.setString('picurl', userImageUrl);
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/image/farmerbg.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: InkWell(
                            onTap: _getImage,
                            child: CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundImage: imageXFile==null ? null:FileImage(File(imageXFile!.path)),
                              child:imageXFile==null ?
                               Icon(
                                Icons.person,
                                color: Colors.white,
                                size: size.width * 0.1,
                              ):null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInputField(
                        icon: Icons.person,
                        hint: 'User',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        controller: nameController,
                      ),
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
                        inputAction: TextInputAction.next,
                        controller: passwordController,
                      ),
                      PasswordInput(
                        icon: Icons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.done,
                        controller: confirmController,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                       TextButton(
                        onPressed: () {
                          formValidation();
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                          //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                   //   RoundedButton(buttonName: 'Register',),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blueAccent
                              ),
                              // style: kBodyText.copyWith(
                              // color: kBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

