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
          backgroundColor: Color.fromARGB(255, 64, 59, 88),
          foregroundColor: Colors.white,
        ),
                
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.headlineSmall,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        ),

        textTheme: ThemeData.dark().textTheme.copyWith(
    bodyMedium: TextStyle(color: darkblueish), 
    bodyLarge: TextStyle(color: darkblueish),
    bodySmall: TextStyle(color: darkblueish), 
  ),
      );
  static ThemeData darktheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkblueish,
      //buttonColor: lightBluishColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Vx.indigo900,
          foregroundColor: Colors.white,
        ),
    
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),  
      ),
    
      textTheme: ThemeData.dark().textTheme.copyWith(
    bodyMedium: const TextStyle(color: Colors.black), 
    bodyLarge: TextStyle(color: creamColor),
    bodySmall: const TextStyle(color: Colors.black), 
  ),
      
      );
      
  static Color creamColor = const Color(0xfff5f5f5);
  static Color greyColor = Vx.gray900;
  static Color lightblueish = Vx.purple400;
  static Color darkblueish = const Color(0xff403b58);
}
