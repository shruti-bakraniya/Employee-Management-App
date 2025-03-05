import 'package:e_tracker/features/employee_management/domain/employee_details_model.dart';
import 'package:e_tracker/utils/constants/api_constants.dart';
import 'package:e_tracker/utils/services/api_services.dart';

class EmployeeDetails {

  Future<List<EmployeeDetailsModel>> fetchEmployeeDetails() async {
    try {
      final response = await ApiServices().getGoogleSheetData(ApiConstants.defaultSheetGID);

      if (response.containsKey("values")) {
        List<EmployeeDetailsModel> employeeNames = [];

        for (var employee in response["values"].skip(1)) {
          if (employee is List && employee.length >= 2) {
            employeeNames.add(EmployeeDetailsModel(
              employeeName: employee[0] ?? "",
              status: (employee[1]?.toString().toLowerCase() ?? '') == 'true' ? true : false,
            ));
          }
        }
        return employeeNames.where((employee) => employee.status == true).toList();
      } else {
        throw Exception("Invalid API response format");
      }
    } catch (e) {
      print("ERROR::Error fetching employee details: $e");
      return [];
    }
  }

  static Future<void> addEmployee(EmployeeDetailsModel employee) async {
    await ApiServices().addEmployee(employee, ApiConstants.defaultSheetGID);
  }

  static Future<void> deactivateEmployee(String employeeName) async {
    await ApiServices().deactivateEmployee(employeeName, ApiConstants.defaultSheetGID);
  }
}
