import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../utils/customWidgets.dart';

class BillPaymentPage extends StatefulWidget {
  @override
  State<BillPaymentPage> createState() => _BillPaymentPageState();
}

class _BillPaymentPageState extends State<BillPaymentPage> {
  // const page4({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(top: 20, child: CustomBackIcon(context)),
              Positioned(
                top: 85,
                left: 0,
                child: Text('Bill Payment',
                    style: TextStyle(
                        color: Constant.textColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ),
              Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Container(
                      height: 555,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        children: [
                          billBox('Collections'),
                          billBox('Cable TV'),
                          billBox('Data Purchase'),
                          billBox('E-Commerce'),
                          billBox('Education'),
                          billBox('Insurance'),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 45,
                right: 0,
                child: Image.asset('assets/notification/wad of money.png'),
              ),
            ]),
      ),
    );
  }
}
