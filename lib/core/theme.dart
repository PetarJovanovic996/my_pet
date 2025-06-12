import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
    textTheme: textTheme,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
  );

  Color get darkPrimaryColor => const Color(0xff623CC2);
  Color get primaryColor => const Color(0xff6E1ABD);
  Color get shadedPrimaryColor => const Color(0xff8359E1);
  Color get accentColor => const Color(0xffFF8367);
  Color get disabledPrimaryColor => const Color(0xffAAA7E3);
  Color get shadowPrimaryColor => const Color(0xff9F74FF);
  Color get successGreenColor => const Color(0xff4EC4A0);
  Color get failureRedColor => const Color(0xffFF7556);
  Color get accentTurqColor => const Color(0xff04CBEF);
  Color get turqColor => const Color(0xff04CBEF);

  Color get primaryTextColor => const Color(0xff584B7F);
  Color get secondaryTextColor => const Color(0xffE7E7E7);
  Color get greyTextColor => const Color(0xff656565);
  Color get darkGreyTextColor => const Color(0xff4F4F4F);
  Color get lightGreyTextColor => const Color(0xff949494);
  Color get overlayColor => const Color(0xffBEA6D0);

  Color get greyBackgroundColor => const Color(0xffE4EBF1);
  Color get selectedBackgroundColor => const Color(0xffB2C0CC);
  Color get primaryBackgroundColor => const Color(0xffEDEBF3);

  Color get taskSuccessColor => const Color(0xff4EC4A0);
  Color get taskRejectedColor => const Color(0xffFF7556);
  Color get taskSubmittedColor => const Color(0xff05C1E3);

  Color get rewardCompleted => const Color(0xff926BEB);

  Color get bronzeColorGradient1 => const Color(0xffE4871A);
  Color get bronzeColorGradient2 => const Color(0xffA96312);

  Color get silverColorGradient1 => const Color(0xffBFBFBF);
  Color get silverColorGradient2 => const Color(0xffA1A1A1);

  Color get goldColorGradient1 => const Color(0xffE3CD00);
  Color get goldColorGradient2 => const Color(0xffE3CD00);

  // Color get taskExpiredColor => const Color(0xff4EC4A0);
  // Color get taskCreatedColor => const Color(0xff4EC4A0);

  Color get lightBlueColor => const Color(0xffB2C0CC);

  TextTheme get textTheme => TextTheme(
    displayLarge: const TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 26,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    displayMedium: const TextStyle(
      //       fontFamily: FontFamily.overpass,
      fontSize: 22,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      //  fontFamily: FontFamily.overpass,
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: primaryTextColor,
    ),
    titleMedium: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: primaryTextColor,
    ),
    titleSmall: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: primaryTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      //  fontFamily: FontFamily.overpass,
      color: primaryTextColor,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 16,
      color: primaryTextColor,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 14,
      color: darkGreyTextColor,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 20,
      color: primaryTextColor,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 18,
      color: primaryTextColor,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      //   fontFamily: FontFamily.overpass,
      fontSize: 16,
      color: primaryTextColor,
      fontWeight: FontWeight.w500,
    ),
  );

  TextStyle get elevatedButtonTextStyle => const TextStyle(
    //   fontFamily: FontFamily.overpass,
    fontSize: 23,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(elevatedButtonTextStyle),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      maximumSize: const WidgetStatePropertyAll(
        Size.fromWidth(double.infinity),
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return disabledPrimaryColor;
        }
        return primaryColor;
      }),
      foregroundColor: WidgetStatePropertyAll(secondaryTextColor),
    ),
  );

  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme();

  TextStyle get labelTextStyle => TextStyle(
    fontSize: 20,
    //   fontFamily: FontFamily.overpass,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );

  TextStyle get bodyTextStyle => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: primaryTextColor,
  );

  TextStyle get largeTextStyle => TextStyle(
    //  fontFamily: FontFamily.overpass,
    fontSize: 36,
    fontWeight: FontWeight.w900,
    color: primaryTextColor,
  );

  TextStyle get textFieldLabelStyle => TextStyle(
    //  fontFamily: FontFamily.overpass,
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: primaryTextColor,
  );

  TextStyle get midLabelStyle => TextStyle(
    //   fontFamily: FontFamily.overpass,
    fontSize: 18,
    color: primaryTextColor,
    fontWeight: FontWeight.w500,
  );
  TextStyle get boldLabelStyle => TextStyle(
    //   fontFamily: FontFamily.overpass,
    fontSize: 20,
    color: shadedPrimaryColor,
    fontWeight: FontWeight.w900,
  );

  TextStyle get boldBodyStyle => const TextStyle(
    //   fontFamily: FontFamily.overpass,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.white,
  );

  BoxDecoration get roundedContainerWithDarkerBorder => BoxDecoration(
    color: shadedPrimaryColor,
    border: Border.all(width: 2, color: shadowPrimaryColor),
    borderRadius: BorderRadius.circular(12.0),
  );
}
