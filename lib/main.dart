import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/providers/meal_favorites.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:meal_app/screens/home.dart';
import 'package:provider/provider.dart';

final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MealFavoritesProvider>(
          create: (context) => MealFavoritesProvider(),
        ),
        ChangeNotifierProvider<MealFiltersProvider>(
          create: (context) => MealFiltersProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal App',
        theme: theme,
        home: const HomeScreen(),
      ),
    );
  }
}
