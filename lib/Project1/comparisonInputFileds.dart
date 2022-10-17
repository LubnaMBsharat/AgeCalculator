import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ageCompration.dart';

class ComparisonInputFileds extends StatelessWidget {
  late String title;
  late String hint;
  late String dateHint;
  late Widget widget;
  late int inputFiledNumber;
  late bool clearTextFiled;

  ComparisonInputFileds(
      {required this.title,
      required this.hint,
      required this.dateHint,
      required this.widget,
      required this.inputFiledNumber,
      required this.clearTextFiled});
  TextEditingController clearText() {
    if (clearTextFiled)
      return TextEditingController()..clear();
    else
      return TextEditingController()..toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(62, 67, 73, 1),
            ),
          ),
          alignment: AlignmentDirectional.topStart,
          margin: EdgeInsets.only(left: 21, top: 15, bottom: 7),
        ),
        Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 1),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(top: 7),
            width: 393,
            height: 40,
            child: Expanded(
              child: TextFormField(
                controller: clearText(),

                //controller: TextEditingController()..clear(),
                //initialValue: hint,
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                readOnly: false,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: hint,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Color.fromRGBO(230, 230, 230, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onChanged: (value) {
                  if (inputFiledNumber == 1) {
                    AgeComparison.hint1 = value;
                  } else
                    AgeComparison.hint2 = value;
                },
              ),
            )),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(230, 230, 230, 1),
              borderRadius: BorderRadius.circular(10)),
          width: 393,
          height: 40,
          margin: EdgeInsets.only(top: 10),
          child: Row(children: [
            Expanded(
              child: TextFormField(
                  controller: TextEditingController()..text = dateHint,
                  // initialValue: hint,
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                  readOnly: true,
                  decoration: InputDecoration(
                    //labelText: hint,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Color.fromRGBO(230, 230, 230, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  )),
            ),
            Container(
              child: widget,
            )
          ]),
        )
      ],
    );
  }
}
