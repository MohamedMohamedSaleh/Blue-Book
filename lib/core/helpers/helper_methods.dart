  import 'package:flutter/material.dart';

MaterialColor getMaterialColor({required Color myColor}) {
  // Color myColor = mainColor;
  return MaterialColor(
    myColor.value,
    {
      50: myColor.withOpacity(.1),
      100: myColor.withOpacity(.2),
      200: myColor.withOpacity(.3),
      300: myColor.withOpacity(.4),
      400: myColor.withOpacity(.5),
      500: myColor.withOpacity(.6),
      600: myColor.withOpacity(.7),
      700: myColor.withOpacity(.8),
      800: myColor.withOpacity(.9),
      900: myColor,
    },
  );
}


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void showMessage(
  {
  required String message,
  bool isSuccess = false,
}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
      ),
      margin: const EdgeInsets.all(20),
      backgroundColor: isSuccess
          ? Theme.of(navigatorKey.currentContext!).primaryColor.withOpacity(.8)
          : Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Column(
        children: [
          Text(message),
        ],
      ),
    ),
  );
}

