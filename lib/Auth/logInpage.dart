import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:octar_app/Auth/Descripage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:octar_app/Auth/check_email.dart';
import 'package:octar_app/Auth/creating_account...page.dart';
import 'package:octar_app/Auth/pin_page.dart';
import 'package:octar_app/Auth/verification_page.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/services/auth_service.dart';

import '../helper/helper.dart';
import '../services/firebase_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, designSize: const Size(414, 895));
    return Scaffold(
        backgroundColor: Constant.backgroundColor,
        body: Center(
          child: Form(
            key: formkey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/onboarding/uu 1.png',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Octar',
                    style: TextStyle(
                        fontSize: 49.55,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return 'enter a correct email';
                            }
                          }),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: 'password',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'password should be more than 6 charaters';
                            }
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MaterialButton(
                        onPressed: () {
                          signIn();
                        },
                        color: const Color(0xFF270162),
                        child: Center(
                            child: Text('Log in',
                                style: TextStyle(color: Colors.white)))),
                  )
                ]),
          ),
        ));
  }

  signIn() async {
    if (formkey.currentState!.validate()) {
      await auth.signInUsingEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      //saving the shared preferences state
      QuerySnapshot snapshot =
          await FirestoreService(uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(emailController.text);
      print(snapshot.docs);
      DbHelper.saveLoggedInState(true);
      DbHelper.saveUsername(snapshot.docs[0]['name']);
      DbHelper.saveEmail(emailController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => VerificationPage()));

      // } else {
      //   showSnackbar(context, Colors.red, value);
      //   setState(() {
      //     _isLoading = false;
      //   });

    }
  }
}
