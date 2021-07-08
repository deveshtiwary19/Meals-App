import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

import 'category_meals_screen.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealID;

  const MealDetailScreen({required this.mealID});

  @override
  Widget build(BuildContext context) {
    //Now, we will get the meal details, according to the meal id
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    //Following widget returns the List of Steps
    Widget listOfSteps() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) => ListTile(
            leading: CircleAvatar(
              child: Text('#${(index + 1)}'),
            ),
            title: Text(selectedMeal.steps[index]),
          ),
          itemCount: selectedMeal.steps.length,
        ),
      );
    }

    //Following method,displays the list of infredients
    Widget listOfIngredients() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        //
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) => Container(
            margin: EdgeInsets.all(5),
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text('${(index + 1)}. ' + selectedMeal.ingredients[index]),
            ),
          ),
          itemCount: selectedMeal.ingredients.length,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //The Image to display
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //Displaying the required ingredients
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            //Now, we have to show a list of ingredients required
            listOfIngredients(),
            //Displaying the required ingredients
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps To Prepare',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            //Now, we have to show a list of ingredients required
            listOfSteps(),
          ],
        ),
      ),
    );
  }
}
