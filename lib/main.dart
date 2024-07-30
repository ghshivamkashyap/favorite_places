import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 56, 49, 66),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.surface,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.montserratTextTheme().copyWith(
    titleSmall: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite places',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite places'),
        ),
      ),
    );
  }
}
