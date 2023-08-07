import 'package:flutter/material.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/customTransact.dart';

class SendMoney extends StatelessWidget {
  String transactType = 'Send\nMoney';
  List<List<String>> rechargeBeneficiary = [
    ['Opadijo Toheeb', 'Ishola dimeji', 'Musa Opadijo'],
    ['0123456789', '9876543210', '6789012345'],
    [
      'assets/send money/GTBank_logo 1.png',
      'assets/send money/Access-and-Diamond-Bank-logo-brand-spur-nigeria-1-1200x900 1.png',
      'assets/send money/Vector (3).png'
    ]
  ];
  String transactId = 'Account number';
  TextEditingController accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.backgroundColor,
        body: CustomTransactPage(
            transactType: transactType,
            rechargeBeneficiary: rechargeBeneficiary,
            transactId: transactId,
            transactIdController: accountNumberController));
  }
}
