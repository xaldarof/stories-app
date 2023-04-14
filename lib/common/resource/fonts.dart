import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle primaryTextStyle(
    {Color? color = Colors.white,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = 14}) {
  return GoogleFonts.nunito(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}
