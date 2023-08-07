import 'package:flutter/material.dart';
import 'package:octar_app/pages/dashboardPage.dart';
import 'dart:async';

class Creating_Account_Page extends StatefulWidget {
  State<Creating_Account_Page> createState() => _Creating_Account_PageState();
}

class _Creating_Account_PageState extends State<Creating_Account_Page> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    DashboardPage(pageIndex: 0))));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF1950D8),
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35),
                      Text('Creating\nAccount...',
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w600,
                              color: Color(0x99FFFFFF))),
                      SizedBox(height: 15),
                      Text('This may take a few moment',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(height: 50),
                      Image.asset('assets/onboarding/money and pie chart.png'),
                    ]),
              ),
            )),
      ),
    );
  }
}
