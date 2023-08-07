import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';

class TransTypeInfo extends StatelessWidget {
  String notifInfo;
  TransTypeInfo({required this.notifInfo});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Constant.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              CustomBackIcon(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Credit\ninfo.',
                    style: TextStyle(
                        color: Constant.textColor,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/notification/wad of money.png')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  bottom: 20.0,
                ),
                child: Container(
                    color: Constant.boxColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 80.0, bottom: 60.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/send money/GTBank_logo 1.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            notifInfo,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(height: 150),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepPurple),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 10, bottom: 20),
                                child: Text('Print reciept',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          SizedBox(height: 10),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 10, bottom: 15),
                                child: Text('Report transaction',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                        ],
                      ),
                    )),
              )
            ]),
          )),
    );
  }
}
