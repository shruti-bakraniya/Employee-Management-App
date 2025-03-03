import 'package:e_tracker/utils/common/app_bar.dart';
import 'package:e_tracker/utils/common/drawer.dart';
import 'package:e_tracker/utils/constants/app_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentIndex = 0;

  void onDrawerItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: currentIndex == 0 ? AppText.employeeAttendance : AppText.employeeManagement,
      ),
      drawer: CustomDrawer(
        onItemSelected: onDrawerItemSelected,
      ),
    );
  }
}
