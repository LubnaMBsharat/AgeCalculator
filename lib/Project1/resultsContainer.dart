import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_project/Project1/topContainer.dart';

import 'AgeStatus.dart';

class ResultsContainer extends StatelessWidget {
  late Color color;
  late Color dataColor;
  late String title;
  late List<String> columnHeader;
  late List<String> columnData = ['21', '5', '14'];
  late double height;
  late Widget bottomContainer;
  ResultsContainer(
      {required this.color,
      required this.dataColor,
      required this.title,
      required this.columnHeader,
      required this.columnData,
      required this.height,
      required this.bottomContainer});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 25, left: 25, bottom: 20),
          height: height,
          width: 360,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Color.fromRGBO(230, 230, 230, 1),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TopContainer(
                color: color,
                dataColor: dataColor,
                title: title,
                columnData: columnData,
                columnHeader: columnHeader),
            // the bottom data
            bottomContainer,
          ]),
        ),
      ],
    );
  }
}
