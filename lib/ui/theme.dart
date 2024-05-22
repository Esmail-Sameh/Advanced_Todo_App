import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {

  /// light theme
  static var light =  ThemeData(
    primaryColor: primaryClr,
    dialogBackgroundColor: primaryClr,
    brightness: Brightness.light,
  );

  /// dark theme
  static var dark = ThemeData(
      primaryColor: darkGreyClr,
      dialogBackgroundColor: darkGreyClr,
      brightness: Brightness.dark,
  );

  /// get heading text style
  TextStyle get headingTextStyle{
    return GoogleFonts.lato(
      color: Get.isDarkMode ? Colors.white  : Colors.black ,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }

  /// get sup heading text style
  TextStyle get supHeadingTextStyle {
    return GoogleFonts.lato(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  /// get title text style
  TextStyle get titleTextStyle{
    return GoogleFonts.lato(
      color: Get.isDarkMode ? Colors.white  : Colors.black ,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  /// get sup title text style
  TextStyle get supTitleTextStyle{
    return GoogleFonts.lato(
      color: Get.isDarkMode ? Colors.white  : Colors.black ,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  /// get body text style
  TextStyle get bodyTextStyle{
    return GoogleFonts.lato(
      color: Get.isDarkMode ? Colors.white  : Colors.black ,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  /// get body2 text style
  TextStyle get body2TextStyle{
    return GoogleFonts.lato(
      color: Get.isDarkMode ? Colors.grey[200]  : Colors.black ,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

}