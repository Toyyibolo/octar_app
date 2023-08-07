import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octar_app/pages/Dashboard/dashboardHome.dart';
import 'package:octar_app/pages/Short_intro.dart';
import 'package:octar_app/pages/dashboardPage.dart';
import 'package:octar_app/pages/userInfo.dart';
import 'package:octar_app/utils/custom_keyboard.dart';
import 'package:octar_app/utils/custom_keyboard1.dart';
import 'package:octar_app/utils/welcome_back_card.dart';
import 'package:octar_app/helper/helper.dart';

import '../smHelper.dart';

class VerificationPage extends StatefulWidget {
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool isVerified = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    getName();
  }

  getName() async {
    await DbHelper.getUsername().then((value) {
      if (value == null) {
        setState(() {
          name = 'new user';
        });
      } else if (value != null) {
        setState(() {
          name = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF1950D8),
            body: Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      WelcomeCard(name: ref.watch(acnProvider)),
                      //SizedBox(height: 10),
                      CustomKeyboard1(
                          to: DashboardPage(pageIndex: 0),
                          isFingerprint: Container()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
