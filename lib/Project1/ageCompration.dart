import 'package:flutter/material.dart';
import 'package:first_project/Project1/comparisonInputFileds.dart';
import 'package:intl/intl.dart';

import 'ComparisonResults.dart';
import 'calculationClass.dart';

class AgeComparison extends StatefulWidget {
  static String hint1 = 'Enter First Person Name';
  static String hint2 = 'Enter Second Person Name';
  @override
  State<AgeComparison> createState() => _AgeComparisonState();
}

class _AgeComparisonState extends State<AgeComparison> {
  DateTime? selctedDate1;
  DateTime? selctedDate2;
  late String older;
  late String younger;

  bool clearTextfiled = false;
  Widget? resultsWidget;
  CalculationClass? cal;
  String getSelsectedDateString(DateTime? selctedDate) {
    if (selctedDate != null) {
      return DateFormat.yMd().format(selctedDate);
    } else
      return 'DD-MM-YYYY';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            leading: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(187, 0, 0, 0),
              ),
              onTap: () {
                AgeComparison.hint1 = 'Enter First Person Name';
                AgeComparison.hint2 = 'Enter Second Person Name';
                Navigator.of(context).pop();
              },
            ),
            title: Text('Age Comparison',
                style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            titleTextStyle: TextStyle(),
            centerTitle: false,
            elevation: .5,
            backgroundColor: Color.fromRGBO(230, 230, 230, 1)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ComparisonInputFileds(
                  title: 'First Person Details',
                  hint: AgeComparison.hint1,
                  inputFiledNumber: 1,
                  dateHint: getSelsectedDateString(selctedDate1),
                  clearTextFiled: clearTextfiled,
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    onPressed: () async {
                      selctedDate1 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                      setState(() {});
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              ComparisonInputFileds(
                  title: 'Second Person Details',
                  hint: AgeComparison.hint2,
                  inputFiledNumber: 2,
                  dateHint: getSelsectedDateString(selctedDate2),
                  clearTextFiled: clearTextfiled,
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    onPressed: () async {
                      selctedDate2 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                      setState(() {});
                    },
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      width: 185,
                      margin: EdgeInsets.only(left: 15, right: 3, top: 5),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(230, 230, 230, 1)),
                        ),
                        onPressed: () {
                          resultsWidget = null;
                          selctedDate1 = null;
                          selctedDate2 = null;
                          AgeComparison.hint1 = 'Enter First Person Name';
                          AgeComparison.hint2 = 'Enter Second Person Name';
                          clearTextfiled = true;
                          setState(() {});
                        },
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 185,
                      margin: EdgeInsets.only(left: 10, right: 5),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(229, 194, 40, 1)),
                        ),
                        onPressed: () {
                          if (selctedDate1 != null &&
                              selctedDate2 != null &&
                              AgeComparison.hint2 !=
                                  'Enter Second Person Name' &&
                              AgeComparison.hint2 !=
                                  'Enter First Person Name') {
                            cal =
                                CalculationClass(selctedDate1!, selctedDate2!);

                            List<String> diff = cal!.calculateDifference();

                            if (selctedDate1!.compareTo(selctedDate2!) > 0) {
                              older = AgeComparison.hint2;
                              younger = AgeComparison.hint1;
                            } else {
                              older = AgeComparison.hint1;
                              younger = AgeComparison.hint2;
                            }
                            clearTextfiled = false;
                            resultsWidget = ComparisonResults(
                                compData: diff,
                                oldername: older,
                                youngername: younger);

                            setState(() {});
                          }
                        },
                        child: Text('Calculate',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
              resultsWidget ?? Container()
            ],
          ),
        ));
  }
}
