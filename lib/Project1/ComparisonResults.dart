import 'package:flutter/cupertino.dart';
import 'package:first_project/Project1/topContainer.dart';

class ComparisonResults extends StatelessWidget {
  late String oldername;
  late String youngername;

  late List<String> compData;
  ComparisonResults({
    required this.compData,
    required this.oldername,
    required this.youngername,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TopContainer(
          color: Color.fromRGBO(66, 69, 74, 1),
          dataColor: Color.fromRGBO(229, 194, 40, 1),
          title: 'Age Difference',
          columnHeader: ['Years', 'Months', 'Days'],
          columnData: compData,
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 355,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(66, 69, 74, 1)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              oldername,
              style: TextStyle(
                  color: Color.fromRGBO(229, 194, 40, 1), fontSize: 16),
            ),
            Text(' is older than ',
                style: TextStyle(
                    color: Color.fromARGB(214, 255, 255, 255), fontSize: 16)),
            Text(
              youngername,
              style: TextStyle(
                  color: Color.fromRGBO(229, 194, 40, 1), fontSize: 16),
            )
          ]),
        )
      ],
    );
  }
}
