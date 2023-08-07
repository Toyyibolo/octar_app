import 'package:flutter/material.dart';
import 'package:octar_app/pages/userInfo.dart';

//void main() => runApp(ShortIntro());

class ShortIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF1950D8),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                SizedBox(height: 35),
                Text("Let's get to Know each-\nother",
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w600,
                        color: Color(0x99FFFFFF))),
                Container(
                  height: 480,
                  width: double.maxFinite,
                  color: Colors.transparent,
                  child: Stack(children: [
                    Positioned(
                        left: 110,
                        child: Image.asset(
                            'assets/onboarding/girls smiling and waving.png',
                            height: 450)),
                    Positioned(
                      top: 30,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfo()));
                        },
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.yellow, shape: BoxShape.circle),
                          child: Center(child: Icon(Icons.arrow_forward)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      child: Text(
                          "it shouldn't take more\nthan 3 minutes to get\nset up and answer a\nfew questions, and\nyou will need some\nphoto ID (like a\npassport or driving\nlicence.)",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    Positioned(
                      bottom: 110,
                      left: 0,
                      child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                          child: Text(
                            'Proceed',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
