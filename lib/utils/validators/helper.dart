import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String calculateOvertime({
  String checkIn = "09:00 AM",
  String checkOut = "06:00 PM",
}) {
  DateFormat format = DateFormat("hh:mm a");
  DateTime inTime = format.parse(checkIn);
  DateTime outTime = format.parse(checkOut);

  Duration workDuration = outTime.difference(inTime);
  int overtimeHours =
      (workDuration.inHours > 9) ? (workDuration.inHours - 9) : 0;

  return "$overtimeHours h";
}

Future<DateTime> selectDate({
  required BuildContext context,
  required DateTime selectedDate,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (picked != null && picked != selectedDate) {
    return picked;
  }
  return selectedDate;
}
