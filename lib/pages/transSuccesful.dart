import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/transFail.dart';

class TransactionSuccess extends StatelessWidget {
  const TransactionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Constant.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20),
              CustomBackIcon(context),
              Text('Transfer\nSuccessful.',
                  style: TextStyle(
                      fontSize: 45,
                      color: Constant.textColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                height: 20,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'B  R  A  V  O !',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'You have successfully transferred\n\$40,000 to Ishola Ajanlekoko,\nKuda Bank - 0098952637',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 20),
              Container(
                height: 435,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/send money/businessman in dark blue suit giving thumbs up.png',
                          height: 420,
                        )),
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
                    Positioned(
                        left: 0,
                        bottom: 230,
                        child: customTransBox(
                            'assets/send money/Vector (2).png',
                            'Repeat transaction')),
                    Positioned(
                        left: 0,
                        bottom: 280,
                        child: Text("You aren't done sending\nmoney? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ))),
                    Positioned(
                        left: 0,
                        bottom: 340,
                        child: GestureDetector(
                          onTap: () {
                            goto(context, TransFail());
                          },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow),
                            child: Center(
                                child: Text('Report transaction',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ))),
                          ),
                        )),
                    Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                            height: 45,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurple),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5),
                              child: Row(children: [
                                Image.asset('assets/send money/Vector (1).png'),
                                SizedBox(width: 10),
                                Text('Go back to Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    )),
                              ]),
                            )))
                  ],
                ),
              ),
            ]),
          )),
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
