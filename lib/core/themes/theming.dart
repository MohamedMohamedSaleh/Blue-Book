import 'package:blue_book/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/helper_methods.dart';


class MyThemes {
 static MaterialColor myMainLightColor = getMaterialColor(myColor: myPrimaryColor);
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: myMainLightColor,
        backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    ),
   
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: myMainLightColor,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      centerTitle: true,
      color: myMainLightColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,      
      ),
    ),
  );

  static ThemeData deepTheme = ThemeData(
    
  );
}


