import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFFFFFF);
const secondaryColor = Color(0xFFF6F6F6);
const blackColor = Color(0xFF000000);
const brownColor = Color(0xFFFFCBAD);

getPrimaryFont({double fontSize, FontStyle fontStyle, Color color}) {
  return TextStyle(
    fontFamily: 'Averta',
    fontWeight: FontWeight.w600,
    fontSize: (fontSize != null) ? fontSize : 18,
    fontStyle: (fontStyle != null) ? fontStyle : FontStyle.normal,
    color: (color != null) ? color : Colors.black,
  );
}

getSecondaryFont({double fontSize, FontStyle fontStyle, Color color}) {
  return TextStyle(
    fontFamily: 'Averta',
    fontSize: (fontSize != null) ? fontSize : 18,
    fontStyle: (fontStyle != null) ? fontStyle : FontStyle.normal,
    color: (color != null) ? color : Colors.black,
  );
}
