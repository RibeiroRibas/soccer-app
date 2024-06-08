import 'package:intl/intl.dart';

class DateTimeFormatHelper {
  static String fromDateTimeToString(DateTime dateTime) {
    final dateFormat = DateFormat("dd/MM/yy");
    return dateFormat.format(dateTime);
  }

  static DateTime parseToDateTime(String goalTime) {
    List<String> parts = goalTime.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);

    DateTime now = DateTime.now();
    return now.copyWith(hour: hours, minute: minutes, second: seconds);
  }
}
