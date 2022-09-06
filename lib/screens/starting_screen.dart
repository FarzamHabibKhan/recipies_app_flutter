import 'package:flutter/material.dart';
import 'package:recipies_app_flutter/constants.dart';

class StartingPage extends StatelessWidget {
  static const id = 'starting_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kScaffoldBackgroundColor,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: const [
                Image(
                  image: AssetImage('images/Dafoods_logo.png'),
                  height: 80,
                  width: 80,
                ),
                Text(
                  'DaFoods',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: kPrimaryColor1,
                    fontWeight: FontWeight.w300,
                    fontSize: 40,
                  ),
                ),
                Text(
                  'Cooking Made Easy',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: kPrimaryColor2,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Get recipes of your favorite foods for ',
                  style: TextStyle(
                    color: kPrimaryColor2,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'FREE',
                  style: TextStyle(
                    color: kPrimaryColor1,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
