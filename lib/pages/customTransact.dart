import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:octar_app/constant.dart';
import 'package:octar_app/pages/transSuccesful.dart';

class CustomTransactPage extends StatefulWidget {
  String transactType;
  List<List<String>> rechargeBeneficiary;
  String transactId;
  TextEditingController transactIdController = TextEditingController();

  CustomTransactPage(
      {required this.transactType,
      required this.rechargeBeneficiary,
      required this.transactId,
      required this.transactIdController});

  @override
  State<CustomTransactPage> createState() => _CustomTransactPageState();
}

class _CustomTransactPageState extends State<CustomTransactPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomBackIcon(context),
              SizedBox(height: 10),
              Container(
                height: 140,
                width: double.maxFinite,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 0,
                      child: Text(
                        widget.transactType,
                        style: TextStyle(
                            height: 1,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Constant.textColor),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 30,
                        width: 350,
                        padding: EdgeInsets.all(5),
                        color: Constant.boxColor,
                        child: Text(
                          'Beneficiaries',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: -15,
                        child: Image.asset(
                          'assets/send money/side view dollar coin.png',
                          height: 170,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 130,
                width: double.maxFinite,
                color: Colors.blue[900],
                child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      bottom: 10.0,
                      top: 20.0,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.rechargeBeneficiary[0].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  color: Colors.white,
                                  child: Image.asset(
                                      widget.rechargeBeneficiary[2][index]),
                                ),
                                SizedBox(height: 5),
                                Text(widget.rechargeBeneficiary[0][index],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                SizedBox(height: 5),
                                Text(
                                  widget.rechargeBeneficiary[1][index],
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        })),
              ),
              SizedBox(height: 15),
              Container(
                height: 30,
                width: double.maxFinite,
                padding: EdgeInsets.all(5),
                color: Constant.boxColor,
                child: Text('New account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18)),
              ),
              SizedBox(height: 15),
              Text(widget.transactId,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              SizedBox(height: 5),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                      controller: widget.transactIdController,
                      decoration: const InputDecoration(
                        hintText: '0123456789',
                        border: InputBorder.none,
                      )),
                ),
              ),
              SizedBox(height: 5),
              Text('Bank',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              SizedBox(height: 5),
              Container(
                height: 60,
                width: 60,
                color: Colors.white,
                child: Image.asset(widget.rechargeBeneficiary[2][0]),
              ),
              SizedBox(height: 10),
              Text('Amount',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
              SizedBox(height: 5),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                      controller: widget.transactIdController,
                      decoration: const InputDecoration(
                        hintText: '0123456789',
                        border: InputBorder.none,
                      )),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransactionSuccess()));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.deepPurple,
                  child: Center(
                      child: Text('Send',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
