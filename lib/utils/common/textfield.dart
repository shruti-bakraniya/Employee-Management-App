import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onTap;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
