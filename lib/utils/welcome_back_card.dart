import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  String name;
  WelcomeCard({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.maxFinite,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Image.asset(
                    'assets/dashboard/young woman wearing smart watch and holding coffee cup.png'),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -25,
            child: Image.asset('assets/onboarding/golden key.png'),
          ),
          Positioned(
            bottom: 110,
            left: 0,
            child: Text(
              'Hi, ${name}\nWelcome back',
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: Color(0x99FFFFFF)),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
                height: 60,
                width: 262,
                decoration: BoxDecoration(
                    color: Color(0xFF3B6ADE),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Input passcode to access your\naccount',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
