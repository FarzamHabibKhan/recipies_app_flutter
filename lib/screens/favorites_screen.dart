import 'package:flutter/material.dart';
import 'package:recipies_app_flutter/models/meal.dart';
import 'package:recipies_app_flutter/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const id = 'favorites_screen';

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You don\'t have any favorites yet'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imgUrl: favoriteMeals[index].imgUrl,
          duration: favoriteMeals[index].duration,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
