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