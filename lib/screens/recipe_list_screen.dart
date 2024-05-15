import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_finder/api/food_details.dart';
import 'package:recipe_finder/color.dart';
import 'package:recipe_finder/models/recipe.dart';
import 'package:recipe_finder/screens/recipe_details_screen.dart';
import 'package:recipe_finder/widgets/recipe_card.dart';
import '../widgets/search_bar.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [];
  String searchQuery = '';
  final bool _isConnected = true;
  @override
  void initState() {
    super.initState();
  }

  void _onSearchSubmitted(String query) async {
    setState(() {
      searchQuery = query;
    });

    if (searchQuery != "") {
      final api = SpoonacularAPI();
      final results = await api.searchRecipesByIngredients(searchQuery);
      setState(() {
        recipes = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/food.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: homePageLinearGradient,
              ),

            ),
            AnimatedPositioned(
              top: searchQuery == "" ? 230 : MediaQuery.of(context).padding.top + 20 + 24,
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: recipes.isEmpty ?
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height:300,
                    child: _isConnected ?Lottie.asset(
                      'lib/assets/lottie/Animation - 1715685628983_food search.json',
                    ):Lottie.asset(
                      'lib/assets/lottie/Animation - 1715685826129_network_error.json',
                    )
                ) :
                Container(
                  height: MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + 20 + 24 ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[const SizedBox(height: 40,)] +
                          recipes.map((recipe) => RecipeCard(
                            recipe: recipe,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsScreen(recipe: recipe),),);
                            },
                        )).toList(),
                    ),
                  ),
                ), // And this
              ),
            ),
            AnimatedPositioned(
              top: (searchQuery == "") ? 170 : MediaQuery.of(context).padding.top + 20,
              // top: 20,
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SearchBar2(
                  onSubmitted: _onSearchSubmitted,
                  width: MediaQuery.of(context).size.width-30,
                  height: 48,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}