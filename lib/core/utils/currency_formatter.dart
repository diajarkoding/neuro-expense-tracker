import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final _ringgitFormatter = NumberFormat.currency(
    locale: 'en_MY',
    symbol: 'RM ',
    decimalDigits: 2,
  );

  static String format(double value) {
    return _ringgitFormatter.format(value);
  }
}
