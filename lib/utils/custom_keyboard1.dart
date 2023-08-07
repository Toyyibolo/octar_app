import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octar_app/helper/helper.dart';
import 'package:octar_app/services/firebase_service.dart';

import '../Auth/creating_account...page.dart';
//import 'package:octar_app/creating_account...page.dart';

class CustomKeyboard1 extends StatefulWidget {
  Widget to;
  Widget isFingerprint;
  CustomKeyboard1({required this.to, required this.isFingerprint});

  @override
  State<CustomKeyboard1> createState() => _CustomKeyboard1State();
}

class _CustomKeyboard1State extends State<CustomKeyboard1> {
  TextEditingController pinOne = TextEditingController();

  TextEditingController pinTwo = TextEditingController();

  TextEditingController pinThree = TextEditingController();

  TextEditingController pinFour = TextEditingController();

  String backspaceSymbol = String.fromCharCode(0x232b);

  String enterSymbol = '\u{2192}';

  int pinInputIndex = 0;

  List<String> currentPin = ["", "", "", ""];

  String pin = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: double.maxFinite,
        color: Colors.transparent,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextBox(pinOne),
            TextBox(pinTwo),
            TextBox(pinThree),
            TextBox(pinFour),
          ]),
          SizedBox(height: 25),
          Row(children: [
            Text_button('1', Color(0xff484c4f), onPressed: () {
              setUp('1');
            }),
            Text_button('2', Color(0xff484c4f), onPressed: () {
              setUp('2');
            }),
            Text_button('3', Color(0xff484c4f), onPressed: () {
              setUp('3');
            }),
          ]),
          SizedBox(height: 5),
          Row(
            children: [
              Text_button('4', Color(0xff484c4f), onPressed: () {
                setUp('4');
              }),
              Text_button('5', Color(0xff484c4f), onPressed: () {
                setUp('5');
              }),
              Text_button('6', Color(0xff484c4f), onPressed: () {
                setUp('6');
              }),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text_button('7', Color(0xff484c4f), onPressed: () {
                setUp('7');
              }),
              Text_button('8', Color(0xff484c4f), onPressed: () {
                setUp('8');
              }),
              Text_button('9', Color(0xff484c4f), onPressed: () {
                setUp('9');
              }),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text_button(backspaceSymbol, Color(0xff373c40), onPressed: () {
                clear();
              }),
              Text_button('0 +', Color.fromARGB(255, 143, 156, 166),
                  onPressed: () {
                setUp('0');
              }),
              Text_button('', Color(0xff5f97f6), onPressed: () {
                DbHelper.getPin().then((value) {
                  if (value == null) {}
                  if (value != null) {
                    if (value == pin) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => widget.to));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          content: Text('Wrong Password',
                              style: TextStyle(color: Colors.red)),
                          actions: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Retry')),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Exit')),
                          ],
                        ),
                      );
                    }
                  }
                });
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (BuildContext context) => widget.to));
              }),
            ],
          ),
          SizedBox(height: 5),
          widget.isFingerprint,
        ]));
  }

  clear() {
    if (pinInputIndex == 4) {
      pinFour.text = '';
      pinInputIndex--;
    } else if (pinInputIndex == 3) {
      pinThree.text = '';
      pinInputIndex--;
    } else if (pinInputIndex == 2) {
      pinTwo.text = '';
      pinInputIndex--;
    } else if (pinInputIndex == 1) {
      pinOne.text = '';
      pinInputIndex = 0;
    }
  }

  setUp(String text) {
    if (pinInputIndex == 0)
      pinInputIndex = 1;
    else if (pinInputIndex < 4) pinInputIndex++;
    setPin(pinInputIndex, text);
    currentPin[pinInputIndex - 1] = text;
    String theOtp = "";
    currentPin.forEach((element) {
      theOtp += element;
    });
    if (pinInputIndex == 4)
      setState(() {
        pin = theOtp;
      });
    print(theOtp);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOne.text = text;
        break;
      case 2:
        pinTwo.text = text;
        break;
      case 3:
        pinThree.text = text;
        break;
      case 4:
        pinFour.text = text;
      //break;

    }
  }
}

class TextBox extends StatelessWidget {
  final TextEditingController textEditingController;
  TextBox(this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 60,
        width: 60,
        //alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: TextField(
            controller: textEditingController,
            style: TextStyle(fontSize: 24, color: Color(0xff8e93a5)),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
            )),
      ),
    );
  }
}

class Text_button extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Function() onPressed;

  Text_button(this.buttonText, this.buttonColor, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 55,
          width: 100,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              buttonText,
              style: TextStyle(color: Color(0xfffcffff), fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
