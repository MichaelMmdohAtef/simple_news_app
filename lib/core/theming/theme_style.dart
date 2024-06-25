import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ThemeStyle{

  static ThemeData lightTheme=ThemeData(
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    ),
    appBarTheme:AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 30,
    ),
  );

  static ThemeData darkTheme=ThemeData(
    appBarTheme:AppBarTheme(
      titleSpacing: 20,
      backgroundColor:const Color(0xff333739),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff333739)
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    ),
    scaffoldBackgroundColor: Color(0xff333739),
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: Color(0xff333739),
    ),
  );

}