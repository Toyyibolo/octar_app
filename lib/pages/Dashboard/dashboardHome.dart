import 'package:flutter/material.dart';
import 'package:octar_app/pages/saveMoney.dart';
import 'package:octar_app/pages/sendMoney.dart';

import '../../constant.dart';
import '../../utils/customWidgets.dart';
import '../Notification/notificationPage.dart';
import '../dashboardPage.dart';
import 'package:octar_app/smHelper.dart';
//import 'package:provider/provider.dart';

class DashBoardHome extends StatefulWidget {
  @override
  State<DashBoardHome> createState() => _DashBoardHomeState();
}

class _DashBoardHomeState extends State<DashBoardHome> {
  bool isVisible = true;

  BalanceState balanceState = BalanceState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardPage(pageIndex: 4)));
                },
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
              const SizedBox(width: 20),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF3B6ADE),
                    border: Border.all(
                        color: const Color(0x805256E5),
                        width: 0.8,
                        style: BorderStyle.values[1])),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: const Text(
                      "Credit Alert: You have just recieved \n \$159.00 from Motunrayo",
                      style: TextStyle(fontSize: 11, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  goto(context, NotificationPage());
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Icon(
                    Icons.notifications_sharp,
                    color: const Color(0xff20299d),
                  )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            width: double.maxFinite,
            height: 280,
            color: Colors.transparent,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 180,
                  width: 310,
                  decoration: BoxDecoration(
                      color: Constant.boxColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.elliptical(10, 10))),
                                child: Center(
                                    child: isVisible
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility))),
                          ),
                          const SizedBox(height: 60),
                          isVisible
                              ? const Text('\$ 2,300.65',
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white))
                              : const Text('****',
                                  style: const TextStyle(
                                      fontSize: 45, color: Colors.white)),
                          const Text('0901189060  - Saving account',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ]),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                child: Image.asset(
                    'assets/dashboard/black wallet with credit card.png'),
              ),
              Positioned(
                bottom: 48,
                left: 0,
                child: actionButton(
                    const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 14,
                    ),
                    'Send', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SendMoney()));
                }),
              ),
              Positioned(
                  bottom: 48,
                  left: 100,
                  child: actionButton(
                      const Icon(
                        Icons.savings,
                        color: Colors.white,
                        size: 14,
                      ),
                      'Save', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SaveMoneyPage()));
                  })),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 35,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: const [
                        Icon(Icons.phone_android_rounded,
                            color: Color.fromARGB(255, 72, 59, 255)),
                        SizedBox(width: 10),
                        Text(
                          'Airtime recharge',
                          style: TextStyle(
                              color: Color.fromARGB(255, 72, 59, 255)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 305,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 72, 59, 255),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(10, 10))),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      transactionNotiWidget(),
                      transactionNotiWidget(),
                      transactionNotiWidget(),
                      transactionNotiWidget(),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
