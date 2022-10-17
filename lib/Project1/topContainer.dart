import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  late String title;
  late Color color;
  late Color dataColor;
  late List<String> columnHeader;
  late List<String> columnData;
  TopContainer(
      {required this.color,
      required this.title,
      required this.columnData,
      required this.columnHeader,
      required this.dataColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // the top container
      width: 360,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(children: [
        Container(
          width: 150,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(214, 255, 255, 255),
                fontWeight: FontWeight.bold),
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
              width: 100,
              margin: EdgeInsets.only(
                top: 5,
                left: 10,
                right: 10,
              ),
              child: Text(e,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(214, 255, 255, 255),
                      fontWeight: FontWeight.bold)),
            );
          }).toList(),
        ),
        Row(
          children: columnData.map((e) {
            return Container(
              width: 103,
              margin: EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
              ),
              child: Text(e,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: dataColor,
                      fontWeight: FontWeight.bold)),
            );
          }).toList(),
        )
      ]),
    );
  }
}
// Color.fromARGB(184, 0, 0, 0)