import 'package:e_tracker/utils/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimeTextFieldWidget extends StatefulWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;

  const CustomTimeTextFieldWidget({
    super.key,
    this.onChanged,
    required this.controller,
  });

  @override
  State<CustomTimeTextFieldWidget> createState() => _CustomTimeTextFieldWidgetState();
}

class _CustomTimeTextFieldWidgetState extends State<CustomTimeTextFieldWidget> {
  late DateTime parsedTime;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      try {
        final parsedTime = DateFormat('hh:mm a').parse(widget.controller.text);
        widget.controller.text = DateFormat('hh:mm a').format(parsedTime);
      } catch (e) {
        widget.controller.text = DateFormat('hh:mm a').format(DateTime.now());
      }
    } else {
      widget.controller.text = DateFormat('hh:mm a').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      parsedTime = DateFormat('hh:mm a').parse(widget.controller.text);
    });
    return CustomTextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: parsedTime.hour, minute: parsedTime.minute),
        );
        if (time != null) {
          String formattedTime =
          DateFormat('hh:mm a').format(DateTime(2000, 1, 1, time.hour, time.minute));
          widget.controller.text = formattedTime;

          if (widget.onChanged != null) {
            widget.onChanged!(formattedTime);
          }
        }
      },
    );
  }
}
