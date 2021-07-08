import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

//Following is the builder method, to return the list tile
  Widget _buildListTile(
      String title, String description, bool currentValue, int cv) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (newValue) {
        if (cv == 1) {
          setState(() {
            _glutenFree = newValue;
          });
        }

        if (cv == 2) {
          setState(() {
            _lactoseFree = newValue;
          });
        }

        if (cv == 3) {
          setState(() {
            _vegetarian = newValue;
          });
        }

        if (cv == 4) {
          setState(() {
            _vegan = newValue;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: ListView(
            children: [
              //The Gluten free switch
              _buildListTile(
                  'Gluten-Free',
                  'Only include gluten free meals in the application',
                  _glutenFree,
                  1),

              SizedBox(
                height: 9,
              ),

              //The switch tile for the Lactoise Free
              _buildListTile(
                  'Lactose-Free',
                  'Only include lactose free meals in the application',
                  _lactoseFree,
                  2),

              SizedBox(
                height: 9,
              ),

              //The switch tile for the Vegetarain Filter
              _buildListTile(
                  'Vegetarian',
                  'Only include vegetaraian meals in the application',
                  _vegetarian,
                  3),

              SizedBox(
                height: 9,
              ),

              //The switch for vean filter
              _buildListTile(
                  'Vegan', 'Only include vegan in the application', _vegan, 4),
            ],
          ))
        ],
      ),
    );
  }
}
