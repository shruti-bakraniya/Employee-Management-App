import 'package:e_tracker/utils/common/container.dart';
import 'package:e_tracker/utils/constants/app_colors.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeListTile extends StatelessWidget {
  final bool hasLeadingAndTrailing;
  final String employeeName;
  final TextStyle? textStyle;

  const EmployeeListTile({
    super.key,
    required this.employeeName,
    this.hasLeadingAndTrailing = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
      child: Row(
        children: [
          hasLeadingAndTrailing ?
          const Padding(
            padding: EdgeInsets.only(
              right: 12.0,
            ),
            child: Icon(
              CupertinoIcons.person_crop_circle,
              color: AppColors.text,
              size: 38,
            ),
          ) : const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              employeeName,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
          ),
          hasLeadingAndTrailing ?
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.alert,
              foregroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              visualDensity: VisualDensity.comfortable,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              )
            ),
            child: Text(
              AppText.remove,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 15.0,
              ),
            ),
          ) : Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Text(
              AppText.action,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
