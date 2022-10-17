import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeStatus extends StatelessWidget {
  List<String> columnFileds = ['Months', 'Weeks', 'Days', 'Hours', 'Minutes'];
  late List<String> columnData = ['258', '1119', '7837', '188088', '112256687'];
  AgeStatus({required this.columnData});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: 150,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            'Age Status',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Color.fromARGB(32, 0, 0, 0))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 30),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1, color: Color.fromARGB(32, 0, 0, 0))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: columnFileds.map((e) {
                    return Text(e);
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: columnData.map((e) {
                    return Text(e);
                  }).toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
