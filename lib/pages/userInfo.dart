import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octar_app/Auth/creating_account...page.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/showDetails.dart';
import 'package:octar_app/services/firebase_service.dart';
import 'package:octar_app/utils/customWidgets.dart';

class UserInfo extends StatefulWidget {
  UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  TextEditingController firstName = TextEditingController();
  TextEditingController familyName = TextEditingController();
  TextEditingController dateofBirth = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController bvnNumber = TextEditingController();

  //FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20, right: 30),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomBackIcon(context),
              SizedBox(height: 10),
              Text('Input your \npersonal\ndetails ',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                      color: Color(0x99FFFFFF))),
              SizedBox(height: 10),
              customField(73 * widthRatio(context), 342 * widthRatio(context),
                  'First name', firstName),
              SizedBox(height: 5),
              customField(73 * widthRatio(context), 342 * widthRatio(context),
                  'Family Name', familyName),
              SizedBox(height: 5),
              customField(73 * widthRatio(context), 342 * widthRatio(context),
                  'Date of Birth', dateofBirth),
              SizedBox(height: 5),
              customField(73 * widthRatio(context), 342 * widthRatio(context),
                  'Home Address', homeAddress),
              SizedBox(height: 5),
              customField(73 * widthRatio(context), 342 * widthRatio(context),
                  'Phone Number', phoneNumber),
              SizedBox(height: 5),
              customField(73 * widthRatio(context), 342 * widthRatio(context),
                  'Bvn Number', bvnNumber),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        FirestoreService(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                            .updateInfo2(
                                name: firstName.text,
                                surName: familyName.text,
                                phoneNumber: phoneNumber.text,
                                dob: dateofBirth.text,
                                homeAddress: homeAddress.text,
                                bvn: bvnNumber.text);
                        goto(context, Creating_Account_Page());
                      },
                      child: const Text('Create account')),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
