import 'package:e_tracker/features/employee_attendance/domain/employee_attendance_model.dart';
import 'package:e_tracker/features/employee_attendance/ui/attendance_detail_tile.dart';
import 'package:e_tracker/utils/common/button.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:e_tracker/utils/validators/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeAttendanceScreen extends StatefulWidget {
  const EmployeeAttendanceScreen({super.key});

  @override
  State<EmployeeAttendanceScreen> createState() =>
      _EmployeeAttendanceScreenState();
}

class _EmployeeAttendanceScreenState extends State<EmployeeAttendanceScreen> {
  dynamic selectedDate = DateTime.now();
  List<EmployeeAttendanceModel> listOfEmployeeAttendanceData = [
    EmployeeAttendanceModel(
      employeeId: "emp001",
      employeeName: "John Doe",
      checkIn: "09:00 AM",
      checkOut: "06:00 PM",
    ),
    EmployeeAttendanceModel(
      employeeId: "emp002",
      employeeName: "Jane Smith",
      checkIn: "08:30 AM",
      checkOut: "07:30 PM",
    ),
    EmployeeAttendanceModel(
      employeeId: "emp003",
      employeeName: "Jack Swan",
    ),
  ];

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
              employeeAttendanceData: listOfEmployeeAttendanceData[index],
            ),
            itemCount: listOfEmployeeAttendanceData.length,
          ),
        )
      ],
    );
  }
}
