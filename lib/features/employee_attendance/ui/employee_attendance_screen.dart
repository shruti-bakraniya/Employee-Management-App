import 'package:e_tracker/features/employee_attendance/data/employee_hrms_data.dart';
import 'package:e_tracker/features/employee_attendance/domain/employee_attendance_model.dart';
import 'package:e_tracker/features/employee_attendance/ui/attendance_detail_tile.dart';
import 'package:e_tracker/features/employee_management/data/employee_details.dart';
import 'package:e_tracker/features/employee_management/domain/employee_details_model.dart';
import 'package:e_tracker/utils/common/button.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:e_tracker/utils/validators/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeAttendanceScreen extends StatefulWidget {
  const EmployeeAttendanceScreen({super.key});

  @override
  State<EmployeeAttendanceScreen> createState() =>
      EmployeeAttendanceScreenState();
}

class EmployeeAttendanceScreenState extends State<EmployeeAttendanceScreen> {
  dynamic selectedDate = DateTime.now();
  List<EmployeeAttendanceModel> filteredEmployeeAttendanceData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<EmployeeAttendanceModel> attendanceData =
    await EmployeeHRMSData().fetchEmployeeHRMSDetails(selectedDate);

    if (attendanceData.isEmpty) {
      List<EmployeeDetailsModel> employees =
      await EmployeeDetails().fetchEmployeeDetails();

      setState(() {
        filteredEmployeeAttendanceData = employees.map((employee) {
          return EmployeeAttendanceModel(
            date: DateFormat('yyyy-MM-dd').format(selectedDate),
            employeeId: "",
            employeeName: employee.employeeName,
          );
        }).toList();
      });
    } else {
      setState(() {
        filteredEmployeeAttendanceData = attendanceData;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: 18.0,
            bottom: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppText.date}: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              CustomButton(
                onPressed: () async {
                  final pickedDate = await selectDate(
                    context: context,
                    selectedDate: selectedDate,
                  );

                  setState(() {
                    selectedDate = pickedDate;
                  });
                  fetchData();
                },
                text: AppText.selectDate,
              ),
            ],
          ),
        ),
        AttendanceDetailTile(
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => AttendanceDetailTile(
              employeeAttendanceData: filteredEmployeeAttendanceData[index],
            ),
            itemCount: filteredEmployeeAttendanceData.length,
          ),
        )
      ],
    );
  }
}
