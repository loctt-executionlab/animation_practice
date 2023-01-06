class DateUtil {
  static String getMonthStrFromInt(int input) {
    //this is more performance than pass in a datetime, probably
    return _monthsInYear[input] ?? "";
  }

  static String getWeekdayStrFromInt(int input) {
    //this is more performance than pass in a datetime, probably
    return _daysInYear[input] ?? "";
  }

  static List<DateTime> getDatesOfMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    final daysCount = firstDayNextMonth.difference(firstDayThisMonth).inDays;

    return List<DateTime>.generate(
        daysCount, (index) => DateTime(date.year, date.month, index + 1));
  }
}

const Map<int, String> _daysInYear = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wendesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday',
};

const Map<int, String> _monthsInYear = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December'
};
