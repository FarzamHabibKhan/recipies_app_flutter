import 'package:flutter/material.dart';
import '/screens/categories_screen.dart';
import '/screens/meal_details.dart';
import '/screens/recipies_screen.dart';
import '/screens/settings_screen.dart';
import './navigation_pages/navigation_bar.dart' as nav;
import './models/meal.dart';
import 'dummy_data.dart';
import './screens/starting_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatefulWidget {
  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => mealId == meal.id),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: nav.NavigationBar.id,
      routes: {
        StartingPage.id: (context) => StartingPage(),
        nav.NavigationBar.id: (context) => nav.NavigationBar(_favoriteMeals),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        SettingsScreen.id: (context) => SettingsScreen(_filters, _setFilters),
        RecipiesScreen.id: (context) => RecipiesScreen(_availableMeals),
        MealDetailScreen.id: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
      },
    );
  }
}
