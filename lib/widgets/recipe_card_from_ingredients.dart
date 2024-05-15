import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder/models/recipe_from_ingredients.dart';

class RecipeCardFromIngredients extends StatelessWidget {
  final RecipeFromIngredients recipe;
  final VoidCallback onTap;

  const RecipeCardFromIngredients({super.key, required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(recipe.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Used Ingredients: ${recipe.usedIngredientCount}',
                      style: const TextStyle(
                        color: Color(0xFF42424F),
                      ),
                    ),
                    Text(
                      'Missed Ingredients: ${recipe.missedIngredientCount}',
                      style: const TextStyle(
                        color: Color(0xFF42424F),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Text(
                        'Likes: ${recipe.likes}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF5F5F73),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}