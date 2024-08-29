import 'package:intl/intl.dart';

class Config {
  static String formatCurrency(String amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return formatter.format(int.parse(amount));
  }
}
