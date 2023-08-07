import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'package:octar_app/helper/helper.dart';

import '../../services/firebase_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String email = '';
  String phoneNumber = '';
  String bvn = '';
  String surName = '';

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  getDetails() async {
    await DbHelper.getEmail().then((value) {
      setState(() {
        email = value!;
      });
    });

    QuerySnapshot snapshot =
        await FirestoreService(uid: FirebaseAuth.instance.currentUser!.uid)
            .gettingUserData(email);
    final firstName = snapshot.docs[0]['name'];
    final phoneNum = snapshot.docs[0]['phoneNumber'];
    final famName = snapshot.docs[0]['surName'];
    final bvnn = snapshot.docs[0]['bvn'];
    setState(() {
      phoneNumber = phoneNum;
      bvn = bvnn;
      surName = famName;
      name = firstName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 20),
        Row(
          children: [
            CustomBackIcon(context),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width - 40,
          color: Colors.transparent,
          child: Stack(children: [
            Positioned(
              right: 0,
              top: 30,
              child: Text('Profile',
                  style: TextStyle(fontSize: 45, color: Constant.textColor)),
            ),
            Positioned(
              bottom: 5,
              child: Container(
                height: 555,
                width: MediaQuery.of(context).size.width - 40,
                //color: Colors.white,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      //topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${phoneNumber} - Savings account',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${name}' +' ' +'${surName}',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                          SizedBox(height: 10),
                          Text('${email}'),
                          SizedBox(height: 10),
                          Text('${phoneNumber}'),
                          SizedBox(height: 10),
                          Text('BVN : ${bvn}'),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Divider(thickness: 2),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Account Officer'),
                              Icon(Icons.play_arrow)
                            ],
                          ),
                          SizedBox(height: 15),
                          Divider(thickness: 2),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Account Statement'),
                              Icon(Icons.play_arrow)
                            ],
                          ),
                          SizedBox(height: 15),
                          Divider(thickness: 2),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Transaction limits'),
                              Icon(Icons.play_arrow)
                            ],
                          ),
                          SizedBox(height: 15),
                          Divider(thickness: 2),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Image.asset('assets/others/profile/Group 417.png'),
                  ),
                ))
          ]),
        ),
      ]),
    ));
  }
}
