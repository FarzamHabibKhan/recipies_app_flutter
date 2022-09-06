import 'package:flutter/material.dart';
import 'package:recipies_app_flutter/constants.dart';
import 'navigation_bar.dart' as nav;
import 'package:recipies_app_flutter/screens/favorites_screen.dart';
import 'package:recipies_app_flutter/screens/settings_screen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: kScaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80,
            child: DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: kPrimaryColor2,
              ),
              child: Text(
                'Menu',
                style: kTopBarTextStyle,
              ),
            ),
          ),
          SideMenuItems(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () =>
                Navigator.pushReplacementNamed(context, nav.NavigationBar.id),
          ),
          SideMenuItems(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () =>
                Navigator.pushReplacementNamed(context, SettingsScreen.id),
          ),
        ],
      ),
    );
  }
}

class SideMenuItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  SideMenuItems({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(vertical: -2),
      leading: Icon(
        icon,
        color: kTextColor,
      ),
      title: Text(
        title,
        style: kCardLabelStyle,
      ),
      onTap: onTap,
    );
  }
}
