class DateUtils {
  // 获取当前是一周的哪一天
  static getCurrentWeekDay() {
    // 定义一个数组，标记一周七天
    final _daysOfWeek = const [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return _daysOfWeek[DateTime.now().weekday - 1];
  }
}
