import 'package:flutter/material.dart';
import 'package:recipies_app_flutter/constants.dart';
import 'package:recipies_app_flutter/screens/recipies_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;

  CategoryItem(this.id, this.title, this.imgUrl);

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      RecipiesScreen.id,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // gesture detector
      onTap: () => selectCategory(context),
      splashColor: kPrimaryColor1,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: kCardLabelStyle,
            ),
          ),
        ],
      ),
    );
  }
}
