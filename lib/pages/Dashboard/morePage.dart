import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../utils/customWidgets.dart';

class page4 extends StatelessWidget {
  const page4({super.key});

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
                child: Text('More',
                    style: TextStyle(
                        color: Constant.textColor,
                        fontSize: 55,
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
                          const SizedBox(height: 10),
                          moreBox(125, 'BANK STATEMENT AND REPORT',
                              'Send money to anyone,anywhere\nin the world through our\nconvetional internet'),
                          moreBox(125, 'CARDS',
                              'Send money to anyone,anywhere\nin the world through our\nconvetional internet'),
                          moreBox(110, 'NEAREST ATM',
                              'Locate the nearest ATM in your\nvicinity'),
                          moreBox(110, 'SECURITY',
                              'Change/Set passcode and other\nsecurity measures'),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 45,
                right: 0,
                child: Image.asset('assets/page4/three blue dots icon.png'),
              ),
            ]),
      ),
    );
  }
}
