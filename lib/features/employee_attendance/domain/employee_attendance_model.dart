class EmployeeAttendanceModel {
  final String employeeId;
  final String employeeName;
  final String checkIn;
  final String checkOut;

  EmployeeAttendanceModel({
    required this.employeeId,
    required this.employeeName,
    this.checkIn = "09:00 AM",
    this.checkOut = "06:00 PM",
  });
}