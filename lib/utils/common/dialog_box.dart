import 'package:e_tracker/utils/common/button.dart';
import 'package:e_tracker/utils/common/textfield.dart';
import 'package:e_tracker/utils/constants/app_colors.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final bool isMessageDialog;
  final String? title;
  final String? message;
  final Function(String)? onPressed;

  const CustomDialogBox({
    super.key,
    this.title,
    this.message,
    this.isMessageDialog = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return AlertDialog(
      title: title != null ? Text(
        title!,
        style: Theme.of(context).textTheme.titleMedium,
      ) : null,
      content: isMessageDialog ? Text(
        message!,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 24.0,
        ),
      ) : CustomTextField(
        controller: controller,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          hintText: AppText.addEmployeeName,
          hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.placeholderText,
          ),
        ),
      ),
      actions: isMessageDialog ? [
         CustomButton(
          text: AppText.ok,
          onPressed: () {
            onPressed!('');
            Navigator.pop(context);
          },
        )
      ] : [
        TextButton(
          style: Theme.of(context).textButtonTheme.style?.copyWith(
            foregroundColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.text,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            AppText.cancel,
          ),
        ),
        CustomButton(
          text: AppText.add,
          onPressed: () {
            onPressed!(controller.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
