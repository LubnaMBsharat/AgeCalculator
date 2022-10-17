//ageCalculator
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_project/Project1/ageCompration.dart';
import 'package:first_project/Project1/calculationClass.dart';
import 'package:first_project/Project1/calculationPage.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';
import 'inputFiled.dart';

class AgeCalculatorW extends StatefulWidget {
  @override
  State<AgeCalculatorW> createState() => _AgeCalculatorStateW();
}

class _AgeCalculatorStateW extends State<AgeCalculatorW> {
  DateTime date = DateTime.now();
  DateTime? selctedDate;
  late List<String> ageList = [];
  late List<String> ageStatus = [];
  late List<String> upComing = [];
  late List<String> countDown = [];

  String getSelsectedDateString() {
    //DateFormat
    if (selctedDate != null) {
      return DateFormat.yMd().format(selctedDate!);
    } else
      return 'DD-MM-YYYY';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selctedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Age Calculator',
              style: TextStyle(
                color: Color.fromRGBO(62, 67, 73, .9),
                //fontFamily: ,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color.fromRGBO(230, 230, 230, 1)),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  //topLeft: Radius.circular(5),
                  // topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: Color.fromRGBO(230, 230, 230, 1),
              ),
              child: Column(children: [
                InputFiled(
                  title: 'Current Age',
                  hint: DateFormat.yMd().format(date),
                ),
                InputFiled(
                  title: 'Date of Birth',
                  hint: getSelsectedDateString(),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    onPressed: () async {
                      selctedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                      print(getSelsectedDateString());
                      setState(() {});
                    },
                  ),
                ),
              ]),
            ),
            InkWell(
              child: Container(
                //margin: EdgeInsets.all(50),
                height: 60,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(229, 194, 40, 1),
                ),

                child: Row(children: [
                  Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Calculate Age",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 185,
                  ),
                  Icon(Icons.arrow_circle_right)
                ]),
              ),
              onTap: () {
                if (selctedDate != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CalculationPage(
                            date: date,
                            selctedDate: selctedDate!,
                          )));
                }
              },
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(15),
                height: 120,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(230, 230, 230, 1)),
                child: Column(children: [
                  Container(
                      width: 90,
                      height: 80,
                      child: Image.asset('images/compImg2.png')),
                  Text(
                    " Age Comparison",
                    style: TextStyle(fontSize: 16),
                  )
                ]),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AgeComparison()));
              },
            ),
          ]),
        ));
  }
}
