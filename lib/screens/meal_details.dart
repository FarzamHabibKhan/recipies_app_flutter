import 'package:flutter/material.dart';
import 'package:recipies_app_flutter/models/meal.dart';
import './../constants.dart';
import 'package:recipies_app_flutter/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const id = 'meal_details';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool isIngedientsSelected = true;
  bool isStepsSelected = false;

  void onIngredientsTap() {
    setState(() {
      isIngedientsSelected = true;
      isStepsSelected = false;
    });
  }

  void onStepsTap() {
    setState(() {
      isStepsSelected = true;
      isIngedientsSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: kAppBarStyle('${selectedMeal.title}'),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    selectedMeal.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 25,
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor2,
                    child: IconButton(
                      onPressed: () => widget.toggleFavorite(mealId),
                      icon: Icon(
                        Icons.star,
                        color: widget.isFavorite(mealId)
                            ? kPrimaryColor1
                            : Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: onIngredientsTap,
                          child: Column(
                            children: [
                              const Text(
                                'Ingredients',
                                style: kTextLabelStyle,
                              ),
                              isIngedientsSelected ? kSelectedLine : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onStepsTap,
                          child: Column(
                            children: [
                              const Text(
                                'Steps',
                                style: kTextLabelStyle,
                              ),
                              isStepsSelected ? kSelectedLine : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Container(
                      width: 380,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20),
                      child: isIngedientsSelected
                          ? ShowRecipe(
                              recipeList: selectedMeal.ingredients,
                            )
                          : ShowRecipe(recipeList: selectedMeal.steps),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowRecipe extends StatelessWidget {
  ShowRecipe({required this.recipeList});

  final List<String> recipeList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(vertical: -4),
          horizontalTitleGap: 0,
          leading: CircleAvatar(
            backgroundColor: kPrimaryColor2,
            foregroundColor: Colors.white,
            radius: 12,
            child: Text('${index + 1}'),
          ),
          title: Text(
            recipeList[index],
            style: kCardLabelStyle,
          ),
        ),
      ),
      itemCount: recipeList.length,
    );
  }
}
