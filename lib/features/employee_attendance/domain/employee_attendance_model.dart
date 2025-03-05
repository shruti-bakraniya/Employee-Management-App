class EmployeeAttendanceModel {
  final String date;
  final String employeeId;
  final String employeeName;
  String checkIn;
  String checkOut;

  EmployeeAttendanceModel({
    required this.date,
    required this.employeeId,
    required this.employeeName,
    this.checkIn = "09:00 AM",
    this.checkOut = "06:00 PM",
  });
}