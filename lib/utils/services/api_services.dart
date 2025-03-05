import 'package:e_tracker/features/employee_management/domain/employee_details_model.dart';
import 'package:e_tracker/utils/constants/api_constants.dart';
import 'package:e_tracker/utils/services/google_sheet_api_data.dart';

class ApiServices {

  Future<Map<String, dynamic>> getGoogleSheetData(String gid) async {
    Map<String, dynamic> response = await GoogleSheetsApiData(
        clientEmail: ApiConstants.clientEmail,
        clientId: ApiConstants.clientID,
        privateKey: ApiConstants.googleSheetPrivateKey,
        url: "${ApiConstants.googleSheetBaseUrl}${ApiConstants.googleSheetId}edit?gid=$gid#gid=$gid",
    ).accessGoogleSheetData();

    return response;
  }

  Future<void> addEmployee(EmployeeDetailsModel employee, String gid) async {
    await GoogleSheetsApiData(
      clientEmail: ApiConstants.clientEmail,
      clientId: ApiConstants.clientID,
      privateKey: ApiConstants.googleSheetPrivateKey,
      url: "${ApiConstants.googleSheetBaseUrl}${ApiConstants.googleSheetId}edit?gid=$gid#gid=$gid",
    ).addEmployee(employee);
  }

  Future<void> deactivateEmployee(String employeeName, String gid) async {
    await GoogleSheetsApiData(
      clientEmail: ApiConstants.clientEmail,
      clientId: ApiConstants.clientID,
      privateKey: ApiConstants.googleSheetPrivateKey,
      url: "${ApiConstants.googleSheetBaseUrl}${ApiConstants.googleSheetId}edit?gid=$gid#gid=$gid",
    ).updateEmployeeStatus(employeeName, false);
  }

  Future<void> updateGoogleSheetData(String gid, List<List<String>> data, bool isUpdate) async {
    try {
      await GoogleSheetsApiData(
        clientEmail: ApiConstants.clientEmail,
        clientId: ApiConstants.clientID,
        privateKey: ApiConstants.googleSheetPrivateKey,
        url: "${ApiConstants.googleSheetBaseUrl}${ApiConstants.googleSheetId}edit?gid=$gid#gid=$gid",
      ).updateGoogleSheet(data, isUpdate);

      print("KDEBUG:: Google Sheets updated successfully!");
    } catch (e) {
      print("ERROR:: Failed to update Google Sheets: $e");
    }
  }
}