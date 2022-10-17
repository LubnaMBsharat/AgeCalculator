import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthdayCountdown extends StatelessWidget {
  List<String> columnHeader = ['Months', 'Days', 'Hours', 'Minutes', 'Seconds'];
  late List<String> columnData;
  BirthdayCountdown({required this.columnData});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: 200,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            'Birthday Countdown',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Color.fromARGB(32, 0, 0, 0))),
          ),
        ),
        Row(
          children: columnHeader.map((e) {
            return Container(
                width: 60,
                margin: EdgeInsets.only(
                  top: 6,
                  left: 5,
                  right: 5,
                ),
                child: Text(e,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      //color: Color.fromARGB(214, 255, 255, 255),
                      //  fontWeight: FontWeight.bold)),
                    )));
          }).toList(),
        ),
        Row(
          children: columnData.map((e) {
            return Container(
              width: 50,
              margin: EdgeInsets.only(
                top: 5,
                left: 10,
                right: 10,
              ),
              child: Text(e,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(163, 0, 0, 0),
                      fontWeight: FontWeight.bold)),
            );
          }).toList(),
        )
      ],
    );
  }
}
