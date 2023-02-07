import 'package:flutter/material.dart';

class All extends StatelessWidget {
  final String title;
  final DateTime date;
  final String note;
  const All({
    Key? key,
    required this.title,
    required this.date,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Container(
        height: 400,
        width: double.infinity,
        color: Colors.blue.shade500,
        child: Expanded(
            child: Container(
          color: Colors.green,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        )),
      )),
    );
  }
}
