import 'package:flutter/cupertino.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#FFFFFF");
  static Color primaryOpacity70 = HexColor.fromHex("#FFFFFF");
  static Color dark = HexColor.fromHex("#000000");
  static Color grey = HexColor.fromHex("#F6F6F6");
  static Color brown = HexColor.fromHex("#FFCBAD");
  static Color error = HexColor.fromHex("#E61F34");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString;
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
