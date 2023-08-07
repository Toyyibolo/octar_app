import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/Notification/transTypeInfo.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                            Text('Notification',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Constant.textColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Image.asset(
                          'assets/notification/bell (1).png',
                          height: 180,
                        ),
                      ],
                    ),
                    notifBox(
                        "Credit Alert: You have just recieved \n \$159.00 from Motunrayo",
                        context),
                    const SizedBox(height: 10),
                    notifBox(
                        "Credit Alert: You have just recieved \n \$159.00 from Motunrayo",
                        context),
                    const SizedBox(height: 10),
                    notifBox(
                        "Credit Alert: You have just recieved \n \$159.00 from Motunrayo",
                        context),
                    const SizedBox(height: 10),
                    notifBox(
                        "Credit Alert: You have just recieved \n \$159.00 from Motunrayo",
                        context),
                  ]),
            ),
          )),
    );
  }
}

Widget notifBox(String notif, BuildContext context) {
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
                  Text(
                    notif,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      goto(
                          context,
                          TransTypeInfo(
                            notifInfo: notif,
                          ));
                    },
                    child: Container(
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
                    ),
                  )
                ],
              )
            ],
          ),
        )),
  );
}
