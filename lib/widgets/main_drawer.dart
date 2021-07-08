import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/favourite_screen.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  //Following is the method, to generate the menu items we need to shoe
  Widget buildListTile(
      String title, IconData icon, int tapHandler, BuildContext buildContext) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => {
        if (tapHandler == 0)
          {
            Navigator.of(buildContext).pushReplacement(
              MaterialPageRoute(builder: (_) {
                return TabsScreen();
              }),
            )
          }
        else
          {
            Navigator.of(buildContext).pushReplacement(
              MaterialPageRoute(builder: (_) {
                return FiltersScreen();
              }),
            )
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 50),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile('Meal Categories', Icons.restaurant, 0, context),
          buildListTile('Filter Settings', Icons.settings, 1, context),
        ],
      ),
    );
  }
}
