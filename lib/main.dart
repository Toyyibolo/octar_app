// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:octar_app/Auth/Descripage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:octar_app/Auth/verification_page.dart';
import 'package:octar_app/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octar_app/helper/helper.dart';
import 'package:octar_app/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: Constant.apiKey,
      appId: Constant.appId,
      messagingSenderId: Constant.messagingSenderId,
      projectId: Constant.projectId,
    ));
  }

  await Firebase.initializeApp();

  runApp(ProviderScope(
    child: ScreenUtilInit(
      builder: (BuildContext context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            // routes: {
            //   'splashPage' : (context) => Description_page(),
            //   'creatingAccountPage': (context) => Creating_Account_Page(),
            //   'pinPage': (context) => PinPage(),
            //   'checkEmail': (context) => Check_email(),
            //   'knowYou': (context) => ()

            // },
            home: OctarApp());
      },
      designSize: const Size(414, 895),
    ),
  ));
}

class OctarApp extends StatefulWidget {
  @override
  State<OctarApp> createState() => _OctarAppState();
}

class _OctarAppState extends State<OctarApp> {
  bool _isLoggedIn = false;
  String email = '';

  void initState() {
    super.initState();
    getUserLoggedInKey();

    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    _isLoggedIn ? VerificationPage() : Description_page())));
  }

  getUserLoggedInKey() async {
    await DbHelper.getLoggedInState().then((value) {
      if (value == null) {
        setState(() {
          _isLoggedIn = false;
        });
      } else if (value != null) {
        setState(() {
          _isLoggedIn = value;
        });
      }
    });

    await DbHelper.getEmail().then((value) {
      if (value != null) {
        setState(() {
          email = value;
           });
      }
    });
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      QuerySnapshot snapshot =
          await FirestoreService(uid: FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(email);
     // DbHelper.saveUsername(snapshot.docs[0]['name']);
    }
  }

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, designSize: const Size(414, 895));
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: 200.h,
        width: double.maxFinite / 2,
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/onboarding/uu 1.png',
                height: 93.h,
                width: 93.w,
              ),
              const SizedBox(height: 10),
              const Text(
                'Octar',
                style: TextStyle(
                    fontSize: 49.55,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1950D8)),
              ),
            ]),
      ),
    ));
  }
}
