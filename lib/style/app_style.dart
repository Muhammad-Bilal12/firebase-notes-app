import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xffe2e2fe);
  static Color mainColor = Color(0xff000633);
  static Color accentColor = Color(0xff0065ff);

  // cards color setting

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.green.shade100,
    Colors.yellow.shade100,
    Colors.blue.shade100,
    Colors.purple.shade100,
  ];

  // setting the text style

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle datetimeTitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.normal);
}
