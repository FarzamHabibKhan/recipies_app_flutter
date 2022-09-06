import 'package:flutter/material.dart';
import 'package:recipies_app_flutter/constants.dart';
import './../navigation_pages/side_menu.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class SettingsScreen extends StatefulWidget {
  static const id = 'settings_screen';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  SettingsScreen(this.currentFilters, this.setFilters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: kTopBarTextStyle,
        ),
        backgroundColor: kPrimaryColor1,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                FilterItems(
                  title: 'Gluten Free',
                  subtitle: 'Only include Gluten free meals',
                  value: _glutenFree,
                  onSwitch: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                FilterItems(
                  title: 'Lactose Free',
                  subtitle: 'Only include Lactose free meals',
                  value: _lactoseFree,
                  onSwitch: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                FilterItems(
                  title: 'Vegetarian',
                  subtitle: 'Only include Vegetarian meals',
                  value: _vegetarian,
                  onSwitch: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                FilterItems(
                  title: 'Vegan',
                  subtitle: 'Only include Vegan meals',
                  value: _vegan,
                  onSwitch: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class FilterItems extends StatefulWidget {
  String title;
  String subtitle;
  bool value;
  void Function(bool) onSwitch;

  FilterItems(
      {required this.title,
      required this.subtitle,
      required this.value,
      required this.onSwitch});

  @override
  State<FilterItems> createState() => _FilterItemsState();
}

class _FilterItemsState extends State<FilterItems> {
  @override
  Widget build(BuildContext context) {
    return ListTileSwitch(
      title: Text(
        widget.title,
        style: kTextLabelStyle,
      ),
      subtitle: Text(
        widget.subtitle,
      ),
      switchScale: 0.65,
      switchActiveColor: kPrimaryColor2,
      switchInactiveColor: kNeutralColor,
      value: widget.value,
      onChanged: widget.onSwitch,
    );
  }
}
