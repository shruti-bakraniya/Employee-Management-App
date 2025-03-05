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
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.secondary,
      onSurface: AppColors.text,
      brightness: Brightness.light,
      secondary: AppColors.secondary,
      onSecondary: AppColors.primary,
      error: AppColors.alert,
      onError: AppColors.secondary,
      background: AppColors.secondary,
      onBackground: AppColors.primary,
      surface: AppColors.secondary,
      surfaceTint: Colors.transparent,
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: AppColors
          .secondary,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.secondary,
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? AppColors.primary
          : AppColors.primary.withOpacity(0.2)),
      dayPeriodColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? AppColors.primary
          : AppColors.secondary),
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? AppColors.secondary
          : AppColors.text),
      dialBackgroundColor: AppColors.primary.withOpacity(0.2),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateTextStyle.resolveWith((states) => TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
          foregroundColor:
          MaterialStateColor.resolveWith((states) => AppColors.primary),
        )),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
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
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.text,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.text,
        fontSize: 15,
        letterSpacing: -0.3,
        height: 1.0,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.secondary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 30,
          ),
        )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      iconSize: 25,
      foregroundColor: AppColors.secondary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
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
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
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
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.secondary,
      onSurface: AppColors.text,
      brightness: Brightness.dark,
      secondary: AppColors.secondary,
      onSecondary: AppColors.primary,
      error: AppColors.alert,
      onError: AppColors.secondary,
      background: AppColors.secondary,
      onBackground: AppColors.primary,
      surface: AppColors.secondary,
      surfaceTint: Colors.transparent,
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: AppColors
          .secondary,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.secondary,
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? AppColors.primary
          : AppColors.primary.withOpacity(0.2)),
      dayPeriodColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? AppColors.primary
              : AppColors.secondary),
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? AppColors.secondary
              : AppColors.text),
      dialBackgroundColor: AppColors.primary.withOpacity(0.2),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateTextStyle.resolveWith((states) => TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
      foregroundColor:
          MaterialStateColor.resolveWith((states) => AppColors.primary),
    )),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.text.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.text.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
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
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.text,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.text,
        fontSize: 15,
        letterSpacing: -0.3,
        height: 1.0,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: AppColors.secondary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 30,
      ),
    )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      iconSize: 25,
      foregroundColor: AppColors.secondary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
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
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    ),
  );
}
