import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


class DateTimeHelper{
  String formatDate(String dateString) {
    final dateTime = DateTime.parse(dateString);
    final dateFormat = DateFormat('E, MMM d • h:mm a');
    return dateFormat.format(dateTime);
  }
  String formatDateTime(String inputDate) {
    try {
      final dateTime = DateTime.parse(inputDate);
      final formattedDate = DateFormat.yMMMMd().format(dateTime);
      return formattedDate;
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing date: $e");
      }
      return "Invalid Date";
    }
  }
  String getDayName(String inputDate) {
    try {
      final dateTime = DateTime.parse(inputDate);
      final formattedDayName = DateFormat('EEEE').format(dateTime);
      return formattedDayName;
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing date: $e");
      }
      return "Invalid Date";
    }
  }
}