import 'package:flutter/material.dart';

class MythemeData {
  static Color primiaryColor = Color(0xff5D9CEC);
  static Color accentColor = Color(0xffDFECDB);
  static Color itemColor = Color(0xff5D9CEC);
  static Color bgItemColor = Color(0xffFFFFFF);
  static Color titleTaskColor = Color(0xff383838);
  static Color subTitleTaskColor = Color(0xffA9A9A9);
  static Color subTitleSettingColor = Color(0xff303030);

  static Color primiaryColorDark = Color(0xff448ee7);
  static Color accentColorDark = Color(0xff060E1E);
  static Color itemColorDark = Color(0xff5D9CEC);
  static Color bgItemColorDark = Color(0xff141922);
  static Color titleTaskColorDark = Color(0xffFFFFFF);
  static Color subTitleTaskColorDark = Color(0xffCDCACA);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primiaryColor,
      accentColor: accentColor,
      scaffoldBackgroundColor: accentColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primiaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: primiaryColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )),

      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: itemColor,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff363636),
        ),
        headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: titleTaskColor,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: subTitleTaskColor,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: subTitleSettingColor,
        ),
        subtitle2:
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: itemColor,
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: itemColor,
      ),);

  static ThemeData darkTheme = ThemeData(
      primaryColor: primiaryColorDark,
      accentColor: accentColorDark,
      scaffoldBackgroundColor: accentColorDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bgItemColorDark,
        selectedItemColor: primiaryColorDark,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: primiaryColorDark,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xff060E1E),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )),

      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: itemColor,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: titleTaskColorDark,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: subTitleTaskColorDark,
        ),
        subtitle1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        subtitle2:
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: itemColorDark,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: accentColorDark,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: itemColor,
      ));
}
