import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_project/Project1/AgeStatus.dart';
import 'package:first_project/Project1/resultsContainer.dart';
import 'package:first_project/Project1/birthdayCountdown.dart';
import 'package:intl/intl.dart';

import 'calculationClass.dart';

class CalculationPage extends StatefulWidget {
  DateTime date;
  DateTime selctedDate;

  CalculationPage({required this.date, required this.selctedDate});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  late List<String> ageList;
  late List<String> ageStatus;
  late List<String> upComing;
  late List<String> countDown;
  CalculationClass? cal;

  calculate() {
    cal = CalculationClass(widget.date, widget.selctedDate);
    ageList = cal!.calculateAge();
    ageStatus = cal!.calculateStatus();
    upComing = cal!.calculateUPComing();
    countDown = cal!.calculateCountDown();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(187, 0, 0, 0),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text('Age Calculator',
                style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            titleTextStyle: TextStyle(),
            centerTitle: false,
            elevation: .5,
            backgroundColor: Color.fromRGBO(230, 230, 230, 1)),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Selected Date: '),
                Text(
                  DateFormat.yMd().format(widget.selctedDate!),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            //Age State
            ResultsContainer(
                color: Color.fromRGBO(229, 194, 40, 1),
                dataColor: Color.fromARGB(184, 0, 0, 0),
                title: 'Age',
                columnHeader: ['Years', 'Months', 'Days'],
                columnData: ageList,
                height: 265,
                bottomContainer: AgeStatus(
                  columnData: ageStatus,
                )),
            ResultsContainer(
                color: Color.fromRGBO(66, 69, 74, 1),
                dataColor: Color.fromRGBO(229, 194, 40, 1),
                title: 'Upcoming Event',
                columnHeader: ['Months', 'Days', 'Day'],
                columnData: upComing,
                height: 220,
                bottomContainer: BirthdayCountdown(
                  columnData: countDown,
                )),
          ],
        ));
  }
}
