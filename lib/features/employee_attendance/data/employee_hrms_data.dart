import 'package:e_tracker/features/employee_attendance/domain/employee_attendance_model.dart';
import 'package:e_tracker/features/employee_attendance/ui/employee_attendance_screen.dart';
import 'package:e_tracker/utils/constants/api_constants.dart';
import 'package:e_tracker/utils/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeHRMSData {

  Future<List<EmployeeAttendanceModel>> fetchEmployeeHRMSDetails(DateTime selectedDate) async {
    try {
      final response = await ApiServices().getGoogleSheetData(ApiConstants.hrmsSheetGID);

      if (response.containsKey("values")) {
        List<EmployeeAttendanceModel> hrmsDetails = [];

        for (var hrmsDetail in response["values"].skip(1)) {
          if (hrmsDetail is List && hrmsDetail.length >= 2) {
            hrmsDetails.add(EmployeeAttendanceModel(
              date: hrmsDetail[0] ?? "",
              employeeId: hrmsDetail[1] ?? "",
              employeeName: hrmsDetail[2] ?? "",
              checkIn: hrmsDetail[3] ?? "",
              checkOut: hrmsDetail[4] ?? "",
            ));
          }
        }
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

        return hrmsDetails.where((hrmsDetail) => hrmsDetail.date == formattedDate).toList();
      } else {
        throw Exception("Invalid API response format");
      }
    } catch (e) {
      print("ERROR::Error fetching employee details: $e");
      return [];
    }
  }

  Future<void> updateEmployeeAttendance(GlobalKey<EmployeeAttendanceScreenState> key) async {
    try {
      if (key.currentState == null) {
        print("ERROR:: Attendance screen state is not mounted.");
        return;
      }
      bool isUpdate = false;

      final List<EmployeeAttendanceModel> existingData =
      await EmployeeHRMSData().fetchEmployeeHRMSDetails(DateTime.now());

      Map<String, EmployeeAttendanceModel> existingDataMap = {
        for (var item in existingData) item.employeeName: item
      };

      List<EmployeeAttendanceModel> updatedData =
          key.currentState!.filteredEmployeeAttendanceData;

      for (var attendance in updatedData) {
        if (existingDataMap.containsKey(attendance.date)) {
          if (existingDataMap.containsKey(attendance.employeeName)) {
            existingDataMap[attendance.employeeName]!.checkIn = attendance.checkIn;
            existingDataMap[attendance.employeeName]!.checkOut = attendance.checkOut;
          } else {
            String newEmployeeId = "emp${(existingData.length + 1).toString().padLeft(3, '0')}";

            existingDataMap[attendance.employeeName] = EmployeeAttendanceModel(
              date: DateFormat('yyyy-MM-dd').format(key.currentState!.selectedDate),
              employeeId: newEmployeeId,
              employeeName: attendance.employeeName,
              checkIn: attendance.checkIn,
              checkOut: attendance.checkOut,
            );
          }
          isUpdate = true;
        } else {
          String newEmployeeId = "emp${(existingData.length + 1).toString().padLeft(3, '0')}";

          existingDataMap[attendance.employeeName] = EmployeeAttendanceModel(
            date: DateFormat('yyyy-MM-dd').format(key.currentState!.selectedDate),
            employeeId: newEmployeeId,
            employeeName: attendance.employeeName,
            checkIn: attendance.checkIn,
            checkOut: attendance.checkOut,
          );
          isUpdate = false;
        }
      }

      List<List<String>> updatedSheetData = [];

      for (var entry in existingDataMap.values) {
        updatedSheetData.add([
          entry.date,
          entry.employeeId,
          entry.employeeName,
          entry.checkIn,
          entry.checkOut
        ]);
      }

      await ApiServices().updateGoogleSheetData(
          ApiConstants.hrmsSheetGID, updatedSheetData, isUpdate);

      print("KDEBUG:: Employee attendance updated successfully!");
    } catch (e) {
      print("ERROR:: Failed to update attendance: $e");
    }
  }

}