import 'package:flutter/material.dart';

import '../constant.dart';

Widget customField(double height, double width, String fieldName,
    TextEditingController fieldController) {
  return Container(
    height: height,
    width: width,
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: TextStyle(color: Colors.white, fontSize: 14)),
        SizedBox(height: 5),
        Container(
          height: 42,
          child: Center(
            child: TextField(
              textAlign: TextAlign.start,
              controller: fieldController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget actionButton(Widget icon, String text, VoidCallback onpressed) {
  return GestureDetector(
    onTap: onpressed,
    child: Container(
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            const SizedBox(width: 10),
            icon,
            const SizedBox(width: 5),
            Text(text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
        height: 35,
        width: 80,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 72, 59, 255),
            borderRadius: BorderRadius.circular(12))),
  );
}

Widget transactionNotiWidget() {
  return SizedBox(
    width: double.maxFinite,
    height: 100,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: 20),
                  Text(
                    '\$ 150.00',
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text('Debit', style: TextStyle(color: Colors.red)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 10, right: 20, bottom: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('To: Nabilah Ayoke   june 2, 2023'),
                Text('4:15pm'),
              ]),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: Divider(
            height: 10,
            thickness: 2,
          ),
        )
      ],
    ),
  );
}

Widget customBox(String upText, String downText, String imgLocation) {
  return Padding(
    padding: const EdgeInsets.only(right: 30),
    child: Container(
      width: double.maxFinite,
      height: 100,
      color: Constant.textColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            upText + "\n" + downText,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Image.asset(imgLocation),
        ]),
      ),
    ),
  );
}

Widget supportBox(String text, String imgLocation) {
  return Container(
      height: 70,
      width: double.maxFinite,
      color: Constant.boxColor,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Image.asset(imgLocation),
          ])));
}

Widget moreBox(double height, String title, String details) {
  return SizedBox(
    height: height,
    child: Column(
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(title, style: const TextStyle(color: Colors.blue)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(details,
                      style: TextStyle(height: 1.1, color: Colors.grey[800]))
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: const Icon(Icons.play_arrow_sharp),
              )
            ],
          ),
        ),
        //SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10),
          child: const Divider(
            thickness: 2,
          ),
        ),
      ],
    ),
  );
}

Widget billBox(String title) {
  return SizedBox(
    height: 60,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(title,
                  style: const TextStyle(fontSize: 15, color: Colors.blue)),
            ),
            Icon(Icons.play_arrow_sharp),
          ],
        ),
        SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10),
          child: const Divider(
            thickness: 2,
          ),
        ),
      ],
    ),
  );
}
