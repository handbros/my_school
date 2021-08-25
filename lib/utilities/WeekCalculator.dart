class WeekCalculator {
  DateTime getStartOfWeek() {
    var startOfWeek = DateTime.saturday;
    var currentDate = DateTime.now();
    var daysSince = currentDate.weekday + (DateTime.sunday - startOfWeek);

    return currentDate.subtract(Duration(days: daysSince));
  }

  DateTime getEndOfWeek() {
    var startOfWeek = DateTime.saturday;
    var currentDate = DateTime.now();
    var daysSince = currentDate.weekday + (DateTime.sunday - startOfWeek);

    var temp = currentDate.subtract(Duration(days: daysSince));

    return temp.add(Duration(days:6));
  }
}