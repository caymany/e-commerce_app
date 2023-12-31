import 'package:devhub_kenya/utils/theme/custom_themes/appbar_theme.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/chip_theme.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/utils/theme/custom_themes/text_theme.dart';

class DAppTheme{
  DAppTheme._();


  ///Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: DTextTheme.lightTextTheme,
    chipTheme: DChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: DAppBarTheme.lightAppBarTheme,
    checkboxTheme: DCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: DBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: DTextFormFieldTheme.lightInputDecorationTheme,
  );

  ///Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: DTextTheme.darkTextTheme,
    chipTheme: DChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: DAppBarTheme.darkAppBarTheme,
    checkboxTheme: DCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: DBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: DElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: DTextFormFieldTheme.darkInputDecorationTheme,
  );
}