import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/Short_intro.dart';
import 'package:octar_app/pages/dashboardPage.dart';
import 'package:octar_app/utils/custom_keyboard.dart';
//import 'package:octar_app/utils/welcome_back_card.dart';

class PinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF1950D8),
      body: Padding(
        padding: EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35),
              Container(
                  height: 300,
                  width: double.maxFinite,
                  color: Colors.transparent,
                  child: Stack(children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Secure your\nAccount',
                          style: TextStyle(
                              fontSize: Constant.textSize,
                              color: Constant.textColor),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'select a passcode strong\nenough to keep your account\nsecure and easy enough\nfor you to always remember.',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    )),
                    SizedBox(height: 20),
                    Positioned(
                        bottom: 10,
                        left: 0,
                        child: Container(
                          height: 25,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 4),
                            child: Text('Input Passcode'),
                          ),
                        )),
                    Positioned(
                        bottom: -22,
                        right: 0,
                        child: Image.asset(
                            'assets/onboarding/yellow padlock with key.png')),
                  ])),

              //SizedBox(height: 10),
              CustomKeyboard(to: ShortIntro(), isFingerprint: Container()),
            ],
          ),
        ),
      ),
    ));
  }
}
