import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onTap;
  final bool readOnly;
  final InputDecoration? decoration;
  final TextStyle? style;

  const CustomTextField({
    super.key,
    required this.controller,
    this.onTap,
    this.readOnly = false,
    this.decoration,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: decoration,
      keyboardType: TextInputType.text,
    );
  }
}
