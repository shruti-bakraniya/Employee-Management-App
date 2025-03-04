import 'package:e_tracker/features/employee_attendance/domain/employee_attendance_model.dart';
import 'package:e_tracker/features/employee_attendance/ui/time_textfield_widget.dart';
import 'package:e_tracker/utils/constants/app_colors.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:e_tracker/utils/validators/helper.dart';
import 'package:flutter/material.dart';

class AttendanceDetailTile extends StatefulWidget {
  final EmployeeAttendanceModel? employeeAttendanceData;
  final TextStyle? textStyle;

  const AttendanceDetailTile({
    super.key,
    this.employeeAttendanceData,
    this.textStyle,
  });

  @override
  State<AttendanceDetailTile> createState() => _AttendanceDetailTileState();
}

class _AttendanceDetailTileState extends State<AttendanceDetailTile> {
  late TextEditingController checkOutTextController;
  late TextEditingController checkInTextController;

  @override
  void initState() {
    super.initState();
    if (widget.employeeAttendanceData != null) {
      checkInTextController = TextEditingController(text: widget.employeeAttendanceData!.checkIn);
      checkOutTextController = TextEditingController(text: widget.employeeAttendanceData!.checkOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 18.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.text.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(4, 4),
            ),
          ]),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: _buildText(
                text: widget.employeeAttendanceData?.employeeName ?? AppText.employeeName,
                context: context,
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: widget.employeeAttendanceData != null ? CustomTimeTextFieldWidget(
                onChanged: (value) {
                  setState(() {
                    checkInTextController.text = value;
                  });
                },
                controller: checkInTextController,
              ) : _buildText(
                text: AppText.checkIn,
                context: context,
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: widget.employeeAttendanceData != null ? CustomTimeTextFieldWidget(
                onChanged: (value) {
                  setState(() {
                    checkOutTextController.text = value;
                  });
                },
                controller: checkOutTextController,
              ) : _buildText(
                text: AppText.checkOut,
                context: context,
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: _buildText(
                text: widget.employeeAttendanceData != null ? calculateOvertime(checkIn: checkInTextController.text, checkOut: checkOutTextController.text) : AppText.overtime,
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText({required String text, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Text(
        text,
        style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
