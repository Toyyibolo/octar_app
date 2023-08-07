import 'package:flutter/material.dart';
import 'package:octar_app/pages/Short_intro.dart';
import 'package:octar_app/Auth/verification_page.dart';

class Check_email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF1950D8),
          body: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('Check your\nMail',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Color(0x99FFFFFF))),
                  const SizedBox(height: 10),
                  Image.asset('assets/onboarding/paper airplane (new).png'),
                  const Text('We just sent an email to\nPhyk98@gmail.com',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 20),
                  const Text(
                      'its a link that will automatically\n sign you into Octar. Do not share\nor forward this email to a third\n-party',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      button(
                          context,
                          'Forward to mail',
                          const Color(0xFF270162),
                          Colors.white,
                          const Color(0x805256E5)),
                      const SizedBox(width: 10),
                      // GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (BuildContext context) =>
                      //                   ShortIntro()));
                      //     },
                      //     child: button(context, 'Resend email',
                      //         Colors.transparent, Colors.white, Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 35,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12)),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VerificationPage()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: const Text("i didn't recieve any mail",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black)),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget button(BuildContext context, String buttonText, Color colors,
    Color textColor, Color borderColor) {
  return Container(
    height: 35,
    width: 150,
    decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: borderColor, width: 0.8, style: BorderStyle.values[1])),
    child: Center(
      child: Row(
        children: [
          const SizedBox(width: 14),
          Text(buttonText, style: TextStyle(fontSize: 16, color: textColor)),
        ],
      ),
    ),
  );
}
