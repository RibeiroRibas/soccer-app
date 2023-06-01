import 'package:intl/intl.dart';

class DateFormatHelper{

  static String fromDateTimeToString(DateTime dateTime){
    final dateFormat = DateFormat("dd/MM/yy");
    return dateFormat.format(dateTime);
  }
}