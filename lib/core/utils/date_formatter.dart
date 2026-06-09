import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String shortDate(DateTime value) {
    return DateFormat('dd MMM yyyy').format(value);
  }

  static String time(DateTime value) {
    return DateFormat('HH:mm').format(value);
  }

  static String monthYear(DateTime value) {
    return DateFormat('MMMM yyyy').format(value);
  }
}
