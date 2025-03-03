import 'package:e_tracker/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    hintColor: AppColors.placeholderText,
    scaffoldBackgroundColor: AppColors.secondary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarBackground,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.appBarText,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondary,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.appBarText,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      width: 300,
      backgroundColor: AppColors.secondary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      hintColor: AppColors.placeholderText,
      scaffoldBackgroundColor: AppColors.secondary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarBackground,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          color: AppColors.appBarText,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.secondary,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.appBarText,
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          color: AppColors.secondary,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          color: AppColors.text,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        width: 300,
        backgroundColor: AppColors.secondary,
      ),
  );

}
