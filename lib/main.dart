import 'package:favorite_places/screens/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite places',
      theme: theme,
      home: PlacesList(
        placeList: [],
      ),
    );
  }
}
