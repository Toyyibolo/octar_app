import 'package:flutter/material.dart';
import 'package:octar_app/Auth/sign_up_page.dart';
import 'package:octar_app/services/auth_service.dart';
import 'package:octar_app/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Auth/pin_page.dart';

class Description_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return SafeArea(
      right: true,
      left: true,
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Constant.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 23).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Image.asset('assets/onboarding/uu 1.png'),
                SizedBox(height: 10.h),
                Container(
                  color: Colors.transparent,
                  child: RichText(
                    text: TextSpan(
                        text: 'transact \n',
                        style: TextStyle(
                            height: 0.8.h,
                            color: Colors.white,
                            fontSize: 86.72.sp,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: 'comfortably.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 43.13.sp,
                                  fontWeight: FontWeight.w600))
                        ]),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'The no.1 payment app in Nigeria that\n allows you to buy and make secure\n payments from anywhere',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
                Column(
                  children: [
                    // SizedBox(width: 10),
                    Container(
                      height: 374.h,
                      width: widthSize,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/onboarding/young man in formalwear sitting on the floor with phone.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    button(
                      context,
                      'Sign in with Apple',
                      const Icon(Icons.apple_sharp),
                      Colors.white,
                      Colors.black,
                      () {},
                    ),
                    SizedBox(height: 10.h),
                    button(
                        context,
                        'Sign in with google',
                        Image.asset(
                          'assets/onboarding/google-logo-9808.png',height: 20
                        ),
                        const Color(0xFF270162),
                        Colors.white, () async {
                      await signInWithGoogle();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => PinPage()));
                    }),
                    const SizedBox(height: 10),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpPage()));
                        },
                        child: Text(
                          'Create an account',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  BuildContext context;
  MyClip(this.context);
  double widthSize(context) {
    return MediaQuery.of(context).size.width;
  }

  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, widthSize(context), 374.h);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}

Widget button(BuildContext context, String buttonText, Widget buttonIcon,
    Color colors, Color textColor, Function() onpressed) {
  return GestureDetector(
    onTap: onpressed,
    child: Container(
      height: 40.h,
      width: 250.w,
      decoration:
          BoxDecoration(color: colors, borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: 45.w),
            buttonIcon,
            SizedBox(width: 5.w),
            Text(buttonText,
                style: TextStyle(fontSize: 16.sp, color: textColor)),
          ],
        ),
      ),
    ),
  );
}



// class MyClipper extends CustomClipper<Rect> {
//   double theWidth;
//   double theheight;

//   MyClipper(this.theWidth, this.theheight);
//   @override
//   Rect getClip(Size size) {
//     return const Rect.fromLTWH(0.0, 0.0, theWidth, theheight);
//   }
//   bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
//     return false;
//   }
// }
 