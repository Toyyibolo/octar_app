import 'package:flutter/material.dart';

class Constant {
  static String apiKey = 'AIzaSyCSunEBxxeSZzL65ABCrTVKg62Zw8f6mB8';
  static String appId = "1:352629740330:web:77ca44d3c23ebd077c0453";
  static String messagingSenderId = "352629740330";
  static String projectId = "octarapp";
  static final backgroundColor = Color(0xFF1950D8);
  static final textColor = Color(0x99FFFFFF);
  static final textSize = 55.0;
  static final boxColor = Color(0xFF3B6ADE);
}

double widthRatio(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double wRatio = screenWidth / 414;
  return wRatio;
}

double heightRatio(context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double hRatio = screenHeight / 895;
  return hRatio;
}

Widget CustomBackIcon(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Icon(Icons.arrow_back_sharp),
        radius: 20),
  );
}

goto(context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

//sha 1
//C9:D1:2E:C3:C4:A0:72:17:7F:A4:22:A8:65:90:09:0C:E2:B3:B3:25 

//sha 256
//85:36:CF:54:16:02:70:E4:A7:52:AF:42:C7:C9:53:91:67:DE:6E:55:C5:96:00:FB:D9:53:85:74:02:73:22:1C