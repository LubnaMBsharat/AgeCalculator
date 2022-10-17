import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputFiled extends StatelessWidget {
  late String title;
  late String hint;
  Widget? widget;

  InputFiled({required this.title, required this.hint, this.widget});

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
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: 370,
          height: 40,
          child: Row(children: [
            Expanded(
              child: TextFormField(
                  controller: TextEditingController()..text = hint,
                  // initialValue: hint,
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(color: Color.fromARGB(150, 0, 0, 0)),
                  readOnly: true,
                  decoration: InputDecoration(
                    //labelText: hint,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  )),
            ),
            widget == null
                ? Container()
                : Container(
                    child: widget!,
                  )
          ]),
        )
      ],
    );
  }
}
