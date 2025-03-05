import 'package:e_tracker/features/employee_management/data/employee_details.dart';
import 'package:e_tracker/features/employee_management/domain/employee_details_model.dart';
import 'package:e_tracker/features/employee_management/ui/employee_list_tile.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:flutter/material.dart';

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({super.key});

  @override
  State<EmployeeManagementScreen> createState() =>
      EmployeeManagementScreenState();
}

class EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  List<EmployeeDetailsModel> employees = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List<EmployeeDetailsModel> employeeList = await EmployeeDetails().fetchEmployeeDetails();
    setState(() {
      employees = employeeList;
    });
  }

  void addEmployee(EmployeeDetailsModel newEmployee) {
    setState(() {
      employees.add(newEmployee);
    });
  }

  void removeEmployee(String employeeName) async {
    setState(() {
      employees.removeWhere((employee) => employee.employeeName == employeeName);
    });

    try {
      await EmployeeDetails.deactivateEmployee(employeeName);
    } catch (e) {
      print("ERROR::Failed to deactivate employee in Google Sheets: $e");
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$employeeName has been deactivated")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 18,
        ),
        EmployeeListTile(
          employeeName: AppText.employeeName,
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          hasLeadingAndTrailing: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) => EmployeeListTile(
              employeeName: employees[index].employeeName,
              onRemove: () => removeEmployee(employees[index].employeeName),
            ),
          ),
        ),
      ],
    );
  }
}
