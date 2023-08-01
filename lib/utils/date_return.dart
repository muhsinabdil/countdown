import 'package:intl/intl.dart';

class DateReturnTypes {
  /// 01.01.2024
  String dateDMYStr(DateTime date) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    String dateString = dateFormat.format(date).toString();
    return dateString;
  }

  /// 01.01.2024 12:00
  String dateDMYHourStr(DateTime date) {
    final dateFormat = DateFormat('dd.MM.yyyy hh:mm');
    String dateString = dateFormat.format(date).toString();
    return dateString;
  }

  /// 2024-01-01
  String dateYMDStr(DateTime date) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    String dateString = dateFormat.format(date).toString();
    return dateString;
  }
}
