import 'package:intl/intl.dart';

String timeFormatter(String date){
  return DateFormat("HH:mm").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}
String dateFormatter(String date){
  return DateFormat("dd-MMM-yyyy HH:mm").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}