import 'package:e_tracker/features/employee_management/domain/employee_details_model.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

class GoogleSheetsApiData {
  String url;
  String clientId;
  String? spreadsheetId;
  String clientEmail;
  String privateKey;
  String? gid;

  GoogleSheetsApiData({
    required this.clientEmail,
    required this.clientId,
    required this.privateKey,
    required this.url
  });

  void extractGidAndIdFromUrl(String url) {
    Uri uri = Uri.parse(url);

    String path = uri.path;
    List<String> pathSegments = path.split('/');

    if (pathSegments.length > 2) {
      spreadsheetId = pathSegments[3];
    }

    String fragment = uri.fragment;

    if (fragment.contains("gid=")) {
      gid = fragment.split("gid=")[1];
    }
  }

  Future<Map<String, dynamic>> accessGoogleSheetData() async {
    Map<String, dynamic> map = {};
    extractGidAndIdFromUrl(url);

    final credentials = ServiceAccountCredentials.fromJson({
      'client_id': clientId,
      'client_email': clientEmail,
      'private_key': privateKey,
      'scopes': [SheetsApi.spreadsheetsReadonlyScope],
      'type': 'service_account'
    });

    final client = await clientViaServiceAccount(
        credentials, [SheetsApi.spreadsheetsReadonlyScope]);

    final sheets = SheetsApi(client);

    try {
      var allTabSheets = await sheets.spreadsheets.get(spreadsheetId!);

      Sheet? sheet = allTabSheets.sheets?.firstWhere((sheet) {
        return sheet.properties?.sheetId.toString() == gid;
      });

      final range = '${sheet?.properties?.title}';

      var response =
      await sheets.spreadsheets.values.get(spreadsheetId!, range);

      map = response.toJson();

      return map;
    } finally {
      client.close();
    }
  }

  Future<void> updateGoogleSheet(List<List<String>> data, bool isUpdate) async {
    extractGidAndIdFromUrl(url);

    final credentials = ServiceAccountCredentials.fromJson({
      'client_id': clientId,
      'client_email': clientEmail,
      'private_key': privateKey,
      'scopes': [SheetsApi.spreadsheetsScope],
      'type': 'service_account'
    });

    final client = await clientViaServiceAccount(
        credentials, [SheetsApi.spreadsheetsScope]);

    final sheets = SheetsApi(client);

    try {
      var allTabSheets = await sheets.spreadsheets.get(spreadsheetId!);

      Sheet? sheet = allTabSheets.sheets?.firstWhere((sheet) {
        return sheet.properties?.sheetId.toString() == gid;
      });

      final sheetTitle = sheet?.properties?.title;
      final range = '$sheetTitle!A:E';
      ValueRange body = ValueRange(values: data);

      if (isUpdate) {
        await sheets.spreadsheets.values.update(
          body,
          spreadsheetId!,
          range,
          valueInputOption: 'RAW',
        );
      } else {
        await sheets.spreadsheets.values.append(
          body,
          spreadsheetId!,
          range,
          valueInputOption: 'RAW',
        );
      }

      print("KDEBUG:: Data successfully updated in Google Sheets!");
    } catch (e) {
      print("ERROR:: Failed to update Google Sheets: $e");
    } finally {
      client.close();
    }
  }

  Future<void> addEmployee(EmployeeDetailsModel employee) async {
    extractGidAndIdFromUrl(url);

    final credentials = ServiceAccountCredentials.fromJson({
      'client_id': clientId,
      'client_email': clientEmail,
      'private_key': privateKey,
      'scopes': [SheetsApi.spreadsheetsScope],
      'type': 'service_account'
    });

    final client = await clientViaServiceAccount(
        credentials, [SheetsApi.spreadsheetsScope]);

    final sheets = SheetsApi(client);

    try {
      var allTabSheets = await sheets.spreadsheets.get(spreadsheetId!);

      Sheet? sheet = allTabSheets.sheets?.firstWhere((sheet) {
        return sheet.properties?.sheetId.toString() == gid;
      });

      final range = '${sheet?.properties?.title}!A:B';

      String statusValue = employee.status ? 'TRUE' : 'FALSE';

      ValueRange valueRange = ValueRange();
      valueRange.values = [
        [employee.employeeName, statusValue]
      ];

      await sheets.spreadsheets.values.append(
        valueRange,
        spreadsheetId!,
        range,
        valueInputOption: 'RAW',
      );
    } finally {
      client.close();
    }
  }

  Future<void> updateEmployeeStatus(String employeeName, bool status) async {
    extractGidAndIdFromUrl(url);

    final credentials = ServiceAccountCredentials.fromJson({
      'client_id': clientId,
      'client_email': clientEmail,
      'private_key': privateKey,
      'scopes': [SheetsApi.spreadsheetsScope],
      'type': 'service_account'
    });

    final client = await clientViaServiceAccount(
        credentials, [SheetsApi.spreadsheetsScope]);

    final sheets = SheetsApi(client);

    try {
      var allTabSheets = await sheets.spreadsheets.get(spreadsheetId!);

      Sheet? sheet = allTabSheets.sheets?.firstWhere((sheet) {
        return sheet.properties?.sheetId.toString() == gid;
      });

      final sheetTitle = sheet?.properties?.title;
      final range = '$sheetTitle!A:B';

      var response = await sheets.spreadsheets.values.get(spreadsheetId!, range);
      List<List<Object?>>? values = response.values;

      if (values != null) {
        for (int rowIndex = 0; rowIndex < values.length; rowIndex++) {
          if (values[rowIndex].isNotEmpty &&
              values[rowIndex][0].toString().trim().toLowerCase() ==
                  employeeName.trim().toLowerCase()) {
            final updateRange = '$sheetTitle!B${rowIndex + 1}';
            String statusValue = status ? 'TRUE' : 'FALSE';

            ValueRange valueRange = ValueRange();
            valueRange.values = [
              [statusValue]
            ];

            await sheets.spreadsheets.values.update(
              valueRange,
              spreadsheetId!,
              updateRange,
              valueInputOption: 'RAW',
            );

            break;
          }
        }
      }
    } finally {
      client.close();
    }
  }
}