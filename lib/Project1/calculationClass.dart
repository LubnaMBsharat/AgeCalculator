import 'package:age_calculator/age_calculator.dart';
import 'package:intl/intl.dart';

class CalculationClass {
  DateTime date;
  DateTime selctedDate;

  CalculationClass(this.date, this.selctedDate);
  //late List<String> ageList = [];
  //late List<String> ageStatus = [];
  late List<String> upComing = [];
  late DateDuration dduration;
  //late List<String> countDown = [];

  String getSelsectedDateString() {
    //DateFormat
    if (selctedDate != null) {
      return DateFormat.yMd().format(selctedDate!);
    } else
      return 'DD-MM-YYYY';
  }

  List<String> calculateAge() {
    List<String> ageList = [];

    dduration = AgeCalculator.age(selctedDate!);
    ageList.add(dduration.years.toString());
    ageList.add(dduration.months.toString());
    ageList.add(dduration.days.toString());
    for (int i = 0; i < 3; i++) {
      print(ageList[i]);
    }

    return ageList;
  }

  List<String> calculateStatus() {
    List<String> ageStatus = [];
    Duration duration = date.difference(selctedDate);
    int months = dduration.years * 12 + dduration.months;
    int weeks = duration.inDays ~/ 7;
    ageStatus.add(months.toString());
    ageStatus.add(weeks.toString());
    ageStatus.add(duration.inDays.toString());
    ageStatus.add(duration.inHours.toString());
    ageStatus.add(duration.inMinutes.toString());
    for (int i = 0; i < 5; i++) {
      print(ageStatus[i]);
    }
    return ageStatus;
  }

  List<String> calculateUPComing() {
    DateDuration duration;
    duration = AgeCalculator.timeToNextBirthday(selctedDate!);

    upComing.add(duration.months.toString());
    upComing.add(duration.days.toString());
    DateTime nextBD = AgeCalculator.add(
        date: DateTime(date.year, selctedDate!.month, selctedDate!.day),
        duration: DateDuration(years: 1, months: 0, days: 0));
    upComing.add(DateFormat('EEEE').format(nextBD));
    for (int i = 0; i < 3; i++) {
      print(upComing[i]);
    }
    return upComing;
  }

  List<String> calculateCountDown() {
    List<String> countDown = [];

    int hours;
    if (date.minute != 0)
      hours = 23 - date.hour;
    else
      hours = 24 - date.hour;

    int m = 60 - date.minute;
    int s = 60 - date.second;

    countDown.add(upComing[0]);
    countDown.add(upComing[1]);
    countDown.add(hours.toString());
    countDown.add(m.toString());
    countDown.add(s.toString());

    for (int i = 0; i < 5; i++) {
      print(countDown[i]);
    }
    return countDown;
    //date.difference(other)
  }

  List<String> calculateDifference() {
    late List<String> difference = [];
    dduration = AgeCalculator.dateDifference(
      fromDate: date,
      toDate: selctedDate,
    );

    difference.add(dduration.years.abs().toString());
    difference.add(dduration.months.abs().toString());
    difference.add(dduration.days.abs().toString());

    return difference;
  }
}
