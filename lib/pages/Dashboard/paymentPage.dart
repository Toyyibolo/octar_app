import 'package:flutter/material.dart';

import '../../constant.dart';
import '../dashboardPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomBackIcon(context),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Make\nPayment',
                style: TextStyle(
                    fontSize: 46, color: Constant.textColor, height: 1),
              ),
              Image.asset("assets/others/page2/fan of banknote.png"),
            ],
          ),
          const SizedBox(height: 10),
          customBox('Send', 'Money',
              'assets/others/page2/black wallet with money.png'),
          const SizedBox(height: 30),
          customBox('Airtime', 'Recharge',
              'assets/others/page2/phone and card standing.png'),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardPage(pageIndex: 5)));
            },
            child: customBox('Bill', 'Payment',
                'assets/others/page2/cash and coins (1).png'),
          ),
        ],
      ),
    )));
  }

  Widget customBox(String upText, String downText, String imgLocation) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        width: double.maxFinite,
        height: 100,
        color: Constant.boxColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              upText + "\n" + downText,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            Image.asset(imgLocation),
          ]),
        ),
      ),
    );
  }
}
