import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_finder/models/recipe_from_ingredients.dart';

class FoodAPI {
  final String apiKey = 'c4c15d79eac44c05b798b64af3c6db06';

  Future<List<RecipeFromIngredients>> fetchFoodByIngredients(String ingredients) async {
    final response = await http.get(
      Uri.parse('https://api.spoonacular.com/recipes/findByIngredients?apiKey=$apiKey&includeIngredients=$ingredients'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => RecipeFromIngredients.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}