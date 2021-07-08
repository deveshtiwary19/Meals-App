import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        child: Text('No items currently in favourites. Add some items now!!',
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center),
      ),
    ));
  }
}
