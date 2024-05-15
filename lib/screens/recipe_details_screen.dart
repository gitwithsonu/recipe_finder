import 'package:flutter/material.dart';
import 'package:recipe_finder/models/recipe.dart';
String dummyFoodDetails = 'It\' really very simple to make this recipe. Just follow the steps below and you will be able to make it in no time.';
class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nutrition:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.nutrients.map((nutrient) => Text('- ${nutrient.name}: ${nutrient.amount} ${nutrient.unit}')).toList(),
                  SizedBox(height: 16),
                  const Text(
                    'How to mak it?:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                        dummyFoodDetails,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF5F5F73),
                        )
                    ),
                  ),
                  // Add more details like nutrition, servings, etc.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}