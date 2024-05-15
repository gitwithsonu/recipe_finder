import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_finder/models/recipe.dart';

class SpoonacularAPI {
  static const String apiKey = 'c4c15d79eac44c05b798b64af3c6db06';
  static const String baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

  Future<List<Recipe>> searchRecipesByIngredients(String ingredients) async {
    if (ingredients.trim() == "pizza"){
      return Future.value((f['results'] as List).map((recipeJson) => Recipe.fromJson(recipeJson)).toList());
    }

    final response = await http.get(Uri.parse('$baseUrl?query=$ingredients&number=10&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (kDebugMode) {
        print(data);
        print(data['results'].length);
      }
      final recipes = (data['results'] as List)
          .map((recipeJson) => Recipe.fromJson(recipeJson))
          .toList();
      return recipes;
    } else {
      if (kDebugMode) {
        print('Failed to load recipes. Status code: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }
      throw Exception('Failed to load recipes');
    }
  }
}

Map f = {
  "results": [
    {
      "id": 716300,
      "title": "Plantain Pizza",
      "image": "https://img.spoonacular.com/recipes/716300-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 23.2532,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 654523,
      "title": "Paneer & Fig Pizza",
      "image": "https://img.spoonacular.com/recipes/654523-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 22.5879,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 661640,
      "title": "Stilton Balsamic Pizza",
      "image": "https://img.spoonacular.com/recipes/661640-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 1.97206,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 662264,
      "title": "summer vegetable pizza",
      "image": "https://img.spoonacular.com/recipes/662264-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 20.424,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 663553,
      "title": "Tomato and Bacon Pizza With Rice Crust",
      "image": "https://img.spoonacular.com/recipes/663553-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 7.2931,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 647124,
      "title": "Homemade Thin Crust Pizza + Pesto + Potato",
      "image": "https://img.spoonacular.com/recipes/647124-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 19.4497,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 715495,
      "title": "Turkey Tomato Cheese Pizza",
      "image": "https://img.spoonacular.com/recipes/715495-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 8.25438,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 651624,
      "title": "Mexican Fiesta Salad Pizza",
      "image": "https://img.spoonacular.com/recipes/651624-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 23.8109,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 658920,
      "title": "Rustic Grilled Peaches Pizza",
      "image": "https://img.spoonacular.com/recipes/658920-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 10.2074,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 663366,
      "title": "Thin Crust Genoa Salami Pizza",
      "image": "https://img.spoonacular.com/recipes/663366-312x231.png",
      "imageType": "png",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 13.2465,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 658615,
      "title": "Roasted Peppers, Spinach & Feta Pizza",
      "image": "https://img.spoonacular.com/recipes/658615-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 17.362,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 1061943,
      "title": "How to Make the Ultimate Christmas Fruit Pizza",
      "image": "https://img.spoonacular.com/recipes/1061943-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 24.0775,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 662605,
      "title": "Sweet Potato, Sausage and Caramelized Onion Pizza",
      "image": "https://img.spoonacular.com/recipes/662605-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 17.9016,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 645020,
      "title": "Golden Potato and Caramelized Onion Flat Bread Pizza",
      "image": "https://img.spoonacular.com/recipes/645020-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 14.6062,
            "unit": "g"
          }
        ]
      }
    },
    {
      "id": 632771,
      "title": "Artichoke, Kalamata, & Sun-Dried Tomato Mini-Pizzas With Garlic and Rosemary",
      "image": "https://img.spoonacular.com/recipes/632771-312x231.jpg",
      "imageType": "jpg",
      "nutrition": {
        "nutrients": [
          {
            "name": "Fat",
            "amount": 3.61963,
            "unit": "g"
          }
        ]
      }
    }
  ],
  "offset": 0,
  "number": 50,
  "totalResults": 15
};