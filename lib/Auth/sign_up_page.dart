import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:octar_app/Auth/loginpage.dart';
import 'package:octar_app/Auth/pin_page.dart';
import 'package:octar_app/helper/helper.dart';
import 'package:octar_app/services/auth_service.dart';
import 'package:octar_app/services/firebase_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Authentication auth = Authentication();

  @override
  void dispose() {
    super.dispose();
    emailController.text;
    passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF1950D8),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Create an\nAccount',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Color(0x99FFFFFF)),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF3B6ADE),
                          border: Border.all(
                              color: const Color(0x805256E5),
                              width: 0.8,
                              style: BorderStyle.values[1])),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            "Tell us the email address and password you'd like to use for Octar",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 8),
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
                            hintText: 'example@gmail.com',
                            border: InputBorder.none,
                          ),
                          validator: (val) {
                            if (val!.contains('@')) {
                              return null;
                            } else {
                              return 'provide a valid email address';
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
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
                            validator: (val) {
                              if (val!.length < 6) {
                                return 'your password must be more than 6 letters';
                              }
                            }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'we will send you a\nconfirmation mail to verify the\nownership of your mail',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        signUp();
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: const Color(0xFF270162),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          height: 5, color: Colors.white, fontSize: 16),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Log in ',
                          style: const TextStyle(
                              height: 0.8, color: Colors.white, fontSize: 16),
                          children: [
                            TextSpan(
                                text: 'here',
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginPage()))),
                          ]),
                    ),
                    const SizedBox(height: 60),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'by signing up, you agree to our T&Cs and privacy policy',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      await auth
          .signUpUsingEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim())
          .then((value) async {
        if (value == true) {
          //saving the shared preferences state
          QuerySnapshot snapshot = await FirestoreService(
                  uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(emailController.text);
          print(snapshot.docs);
          DbHelper.saveLoggedInState(true);
          DbHelper.saveUsername(snapshot.docs[0]['name']);
          DbHelper.saveEmail(emailController.text);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PinPage()));

          // } else {
          //   showSnackbar(context, Colors.red, value);
          //   setState(() {
          //     _isLoading = false;
          //   });
        }
      });
    }
  }
}
