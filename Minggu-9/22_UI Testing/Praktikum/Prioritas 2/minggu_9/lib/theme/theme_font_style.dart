import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minggu_9/theme/theme_color.dart';

class ThemeTextStyle {
  TextStyle RobotoLarge = GoogleFonts.roboto(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: ThemeColor().dark,
  );

  TextStyle HeadRobotoSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: ThemeColor().dark,
  );
  TextStyle RobotoMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().dark,
  );
  TextStyle BodyRobotoSmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColor().LightPurple60,
  );
  TextStyle BodyRobotoLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ThemeColor().LightPurple60,
  );
  TextStyle LabelRobotoLarge = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemeColor().WhiteColor,
  );
}
