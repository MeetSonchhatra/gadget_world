import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,//
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,//
        canvasColor: creamColor,//
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
        ),
                
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.headlineSmall,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall,

        ),
      );
  static ThemeData darktheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkblueish,
      //buttonColor: lightBluishColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
        ),
    
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),  
      ),

      textTheme: ThemeData.dark().textTheme.copyWith(
    bodyMedium: TextStyle(color: Colors.black), 
    bodyLarge: TextStyle(color: Colors.black),
    bodySmall: TextStyle(color: Colors.black), 
  ),
      
      );
      
  static Color creamColor = Color(0xfff5f5f5);
  static Color greyColor = Vx.gray900;
  static Color lightblueish = Vx.purple400;
  static Color darkblueish = Color(0xff403b58);
}
