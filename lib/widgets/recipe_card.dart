import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder/models/recipe.dart';
class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const RecipeCard({super.key, required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          // border: Border.all(color: const Color(0xfff1f1f1), width: 0),
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
                    image: CachedNetworkImageProvider(recipe.imageUrl),
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
                    ...recipe.nutrients.map((nutrient) => Text('${nutrient.name} ${nutrient.amount} ${nutrient.unit}',
                      style: TextStyle(
                        color: const Color(0xFF42424F),
                      ),)).toList(),
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


String dummyFoodDetails = 'It\' really very simple to make this recipe. Just follow the steps below and you will be able to make it in no time.';