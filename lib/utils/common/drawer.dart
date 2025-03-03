import 'package:e_tracker/utils/constants/app_colors.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Text(
                AppText.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: AppColors.primary,
                size: 25,
              ),
              title: Text(
                AppText.employeeAttendance,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onTap: () => onItemSelected(0),
            ),
            ListTile(
              leading: const Icon(
                Icons.people_alt_outlined,
                color: AppColors.primary,
                size: 25,
              ),
              title: Text(
                AppText.employeeManagement,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onTap: () => onItemSelected(1),
            ),
          ],
        ),
      ),
    );
  }
}
