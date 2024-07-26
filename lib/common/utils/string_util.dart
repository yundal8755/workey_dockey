import 'package:intl/intl.dart';

class WageFormat {
  static String wageToString(int wage) {
    return NumberFormat('###,###,###,###').format(wage);
  }
}

class AppDate {
  static String dateTimeToString(DateTime dateTime) {
    return DateFormat('yyyy.MM.dd').format(dateTime);
  }
}
