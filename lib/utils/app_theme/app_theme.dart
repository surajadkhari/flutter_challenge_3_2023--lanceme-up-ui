import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constant/app_color_constant.dart';

class LancemeUpAppTheme {
  // 1
  static TextTheme lightTextTheme = const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      // fontWeight: FontWeight.w700,
      color: AppColorResources.kTextLightGrey,
    ),
    bodyLarge: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      // fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),

    // headline1: GoogleFonts.openSans(
    //   fontSize: 32.0,
    //   fontWeight: FontWeight.bold,
    //   color: Colors.black,
    // ),
    // headline2: GoogleFonts.openSans(
    //   fontSize: 21.0,
    //   fontWeight: FontWeight.w700,
    //   color: Colors.black,
    // ),
    // headline3: GoogleFonts.openSans(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w600,
    //   color: Colors.black,
    // ),
    // headline6: GoogleFonts.openSans(
    //   fontSize: 20.0,
    //   fontWeight: FontWeight.w600,
    //   color: Colors.black,
    // ),
  );

  // 3
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColorResources.bgScaffold,
      fontFamily: "Urban",
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white, size: 20),
          backgroundColor: AppColorResources.appPrimaryColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: TextStyle(
            fontFamily: "Urban",
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  // 4
  // static ThemeData dark() {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     appBarTheme: AppBarTheme(
  //       foregroundColor: Colors.white,
  //       backgroundColor: Colors.grey[900],
  //     ),
  //     floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //       foregroundColor: Colors.white,
  //       backgroundColor: Colors.green,
  //     ),
  //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //       selectedItemColor: Colors.green,
  //     ),
  //     textTheme: darkTextTheme,
  //   );
  // }
}
