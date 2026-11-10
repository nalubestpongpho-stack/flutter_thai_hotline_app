import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash_screen_ui.dart';

void main() {
  runApp(const ThaiHotlineApp());
}

class ThaiHotlineApp extends StatelessWidget {
  const ThaiHotlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF555555);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      surface: const Color(0xFFFAFAFA),
    );

    return MaterialApp(
      title: 'สายด่วน THAILAND',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        textTheme: GoogleFonts.kanitTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD9D9D9),
          foregroundColor: Color(0xFF222222),
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const SplashScreenUI(),
    );
  }
}
