import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant.dart';
import '../../smHelper.dart';
import '../../utils/customWidgets.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          CustomBackIcon(context),
          const SizedBox(height: 20),
          Text('Support',
              style: TextStyle(fontSize: 35, color: Constant.textColor)),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: double.maxFinite,
            color: Constant.boxColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Text(
                    'ACCOUNT OFFICER\nMR. OPADIJO TOHEEB\n07068957720"\nadekunleopadijo@gmail.com',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                const SizedBox(width: 16),
                Image.asset('assets/others/page 3/account.png'),
              ]),
            ),
          ),
          const SizedBox(height: 10),
          supportBox('Live Chat', 'assets/others/page 3/chat message.png'),
          const SizedBox(height: 10),
          supportBox('FAQ',
              'assets/others/page 3/close up of white question mark.png'),
          const SizedBox(height: 10),
          supportBox('Help Line',
              'assets/others/page 3/front view of yellow retro phone.png'),
          const SizedBox(height: 10),
          supportBox('Email us', 'assets/others/page 3/at sink.png'),
          const SizedBox(height: 10),
          supportBox('Social media',
              'assets/others/page 3/Smarphone display with instagram.png'),
        ]),
      ),
    );
  }
}
