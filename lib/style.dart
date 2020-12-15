import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF1FADCC);
const Color accentColor = Color(0xFFFF6464);
const Color backgroundColor = Colors.white;
const Color mainTextColor = Color(0xFF2E3E5C);
const Color secondaryTextColor = Color(0xFF9FA5C0);
const Color formColor = Color(0xFFF4F5F7);
const Color indicatorColor = Color(0xFF1FCC79);
const Color greenSubtleColor = Color(0xFFE3FFF1);
const Color headerColor = Color(0xFF3E5481);
const Color outlineColor = Color(0xFFD0DBEA);

final String mainFontFamily = "Inter";

final textTheme = TextTheme(
  bodyText1: TextStyle(
    color: mainTextColor,
    fontSize: 17,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  ),
  bodyText2: TextStyle(
    color: secondaryTextColor,
    fontSize: 15,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  ),
  subtitle1: TextStyle(
    color: mainTextColor,
    fontSize: 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  ),
  headline1: TextStyle(
    color: headerColor,
    fontSize: 22,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  ),
  headline2: TextStyle(
    color: headerColor,
    fontSize: 17,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  ),
  headline3: TextStyle(
    color: headerColor,
    fontSize: 15,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  ),
);
