import 'package:flutter/material.dart';
import '/screens/favorites_screen.dart';
import '../constants.dart';
import '/screens/categories_screen.dart';
import 'side_menu.dart';
import '/models/meal.dart';

class NavigationBar extends StatefulWidget {
  static const id = 'navigation_bar';

  final List<Meal> favoriteMeals;

  NavigationBar(this.favoriteMeals);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  late List<Map<String, dynamic>> _pages;

  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: kAppBarStyle(_pages[_selectedIndex]['title']),
      drawer: SideMenu(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: kPrimaryColor1,
        unselectedItemColor: kNeutralColor,
        backgroundColor: kPrimaryColor2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
      body: _pages[_selectedIndex]['page'],
    );
  }
}
