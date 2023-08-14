import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      fontFamily: GoogleFonts.roboto().fontFamily,
      scaffoldBackgroundColor: Vx.hexToColor("#292F3F"),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Vx.hexToColor("#FFFFFF"),
            displayColor: Vx.hexToColor("#FFFFFF"),
          ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          elevation: 10,
          backgroundColor: Vx.green500,
          textStyle: const TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static final fontFamily = GoogleFonts.mulish();
}
