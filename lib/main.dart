import 'package:blue_book/core/themes/theming.dart';
import 'package:blue_book/features/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/colors.dart';
import 'core/helpers/helper_methods.dart';

void main() { 
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(
          myColor: myPrimaryColor),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      home: const LoginView(),
    );
  }
}
