import 'package:e_tracker/features/employee_attendance/data/employee_hrms_data.dart';
import 'package:e_tracker/features/employee_attendance/ui/employee_attendance_screen.dart';
import 'package:e_tracker/features/employee_management/data/employee_details.dart';
import 'package:e_tracker/features/employee_management/domain/employee_details_model.dart';
import 'package:e_tracker/features/employee_management/ui/employee_management_screen.dart';
import 'package:e_tracker/utils/common/app_bar.dart';
import 'package:e_tracker/utils/common/dialog_box.dart';
import 'package:e_tracker/utils/common/drawer.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentIndex = 0;
  final GlobalKey<EmployeeManagementScreenState> _employeeManagementKey =
  GlobalKey();
  final GlobalKey<EmployeeAttendanceScreenState> _attendanceScreenKey = GlobalKey();


  void onDrawerItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pop(context);
  }

  void _addNewEmployee(EmployeeDetailsModel newEmployee) {
    _employeeManagementKey.currentState?.addEmployee(newEmployee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: currentIndex == 0 ? AppText.employeeAttendance : AppText.employeeManagement,
      ),
      body: currentIndex == 0 ? EmployeeAttendanceScreen(key: _attendanceScreenKey,) : EmployeeManagementScreen(key: _employeeManagementKey,),
      drawer: CustomDrawer(
        onItemSelected: onDrawerItemSelected,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => CustomDialogBox(
              title: currentIndex == 0 ? AppText.success : AppText.addNewEmployee,
              message: AppText.successMessage,
              isMessageDialog: currentIndex == 0 ? true : false,
              onPressed: (text) async {
                if (currentIndex == 0) {
                  await EmployeeHRMSData().updateEmployeeAttendance(_attendanceScreenKey);
                  _attendanceScreenKey.currentState!.selectedDate = DateTime.now();
                  _attendanceScreenKey.currentState!.fetchData();
                } else {
                  if (text.isNotEmpty) {
                    EmployeeDetailsModel newEmployee = EmployeeDetailsModel(
                      employeeName: text,
                      status: true,
                    );

                    _addNewEmployee(newEmployee);

                    try {
                      await EmployeeDetails.addEmployee(newEmployee);
                    } catch (e) {
                      print("ERROR::Failed to add employee to Google Sheets: $e");
                    }
                  }
                  print("KDEBUG:: Employee name: $text");
                }
              },
            ),
          );
        },
        child: Icon(
          currentIndex == 0 ? Icons.refresh : Icons.add,
        ),
      ),
    );
  }
}
