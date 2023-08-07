import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';

class SaveMoneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Constant.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomBackIcon(context),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Save\nMoney',
                                style: TextStyle(
                                    fontSize: 45,
                                    color: Constant.textColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Image.asset(
                            'assets/others/savemoney/open home safe with money.png'),
                      ],
                    ),
                    saveBox('Hajj Plan Savings', '\$ 100 Monthly', '1.'),
                    const SizedBox(height: 10),
                    saveBox('Hajj Plan Savings', '\$ 100 Monthly', '1.'),
                    const SizedBox(height: 10),
                    saveBox('Hajj Plan Savings', '\$ 100 Monthly', '1.'),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                            height: 100,
                            width: double.maxFinite,
                            color: Constant.boxColor,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                            )))
                  ]),
            ),
          )),
    );
  }
}

Widget saveBox(String savingPlan, String amount, String index) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: Container(
        height: 100,
        width: double.maxFinite,
        color: Constant.boxColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(child: Text(index)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    savingPlan,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    amount,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.yellow,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: Text(
                        'View details >>',
                        style: TextStyle(fontSize: 11),
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        )),
  );
}
