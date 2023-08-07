// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/Dashboard/billPaymentPage.dart';
import 'package:octar_app/pages/Dashboard/profilePage.dart';
import 'package:octar_app/pages/userInfo.dart';

import 'Dashboard/dashboardHome.dart';
import 'Dashboard/morePage.dart';
import 'Dashboard/paymentPage.dart';
import 'Dashboard/supportPage.dart';

class DashboardPage extends StatefulWidget {
  int pageIndex;
  DashboardPage({required this.pageIndex});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //widget.pageIndex = 0;
  final pages = [
    DashBoardHome(),
    const PaymentPage(),
    const SupportPage(),
    const page4(),
    ProfilePage(),
    BillPaymentPage(),
  ];
  // void initState() {
  //   super.initState();
  //   widget.pageIndex = 0;
  // }

  @override
  Widget build(BuildContext context) {
    //widget.pageIndex = 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1950D8),
        body: Stack(
          children: [
            pages[widget.pageIndex],
            Positioned(
              bottom: 20,
              left: 30,
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Constant.backgroundColor,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.pageIndex = 0;
                          });
                          //print(widget.pageIndex);
                        },
                        icon: widget.pageIndex == 0
                            ? const Icon(Icons.home_filled,
                                color: Colors.white, size: 35)
                            : Icon(Icons.home_filled,
                                color: Colors.blue[900], size: 35)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.pageIndex = 1;
                          });
                          //print(widget.pageIndex);
                        },
                        icon: widget.pageIndex == 1
                            ? const Icon(Icons.monetization_on,
                                color: Colors.white, size: 35)
                            : Icon(Icons.monetization_on,
                                color: Colors.blue[900], size: 35)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.pageIndex = 2;
                          });
                          print(widget.pageIndex);
                        },
                        icon: widget.pageIndex == 2
                            ? const Icon(Icons.headset_mic_rounded,
                                color: Colors.white, size: 35)
                            : Icon(Icons.headset_mic_rounded,
                                color: Colors.blue[900], size: 35)),
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.pageIndex = 3;
                              });
                              print(widget.pageIndex);
                            },
                            icon: widget.pageIndex == 3
                                ? Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: Icon(Icons.more_horiz_rounded,
                                          size: 25),
                                    ),
                                  )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.blue[900],
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: Icon(Icons.more_horiz_rounded,
                                          size: 25),
                                    ),
                                  ))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
