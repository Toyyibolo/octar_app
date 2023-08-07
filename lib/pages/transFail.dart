// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';

class TransFail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constant.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomBackIcon(context),
              Text(
                'Transfer\nFailed.',
                style: TextStyle(color: Constant.textColor, fontSize: 45),
              ),
              const SizedBox(height: 15),
              Container(
                height: 20,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'N E T W O R K  E R R O R !',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You attempt to transfer \$400,000.00 to Ishola Ajanlekoko was not succesful,\nCheck your network and try again.',
                style: TextStyle(
                    color: Color.fromARGB(255, 73, 59, 59), fontSize: 15),
              ),
              SizedBox(height: 20),
              Row(children: [
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Icon(Icons.refresh), Text('Retry')]),
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.home_filled,
                            color: Colors.white,
                          ),
                          Text(
                            'Go back to Home',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                  ),
                )
              ]),
              SizedBox(height: 7),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/send money/Man facepalming at wi-fi loss.png',
                        height: 400,
                      ),
                    ),
                    Positioned(
                        left: 0,
                        bottom: 30,
                        child: customTransBox(
                            'assets/send money/Vector (3).png',
                            'Schedule transfer')),
                    Positioned(
                        left: 0,
                        bottom: 80,
                        child: customTransBox(
                            'assets/send money/Vector (3).png',
                            'Save as beneficiary')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

customTransBox(String theIcon, String detail) {
  return Container(
      height: 35,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5),
        child: Row(children: [
          Image.asset(theIcon),
          SizedBox(width: 10),
          Text(detail,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 13,
              )),
        ]),
      ));
}
