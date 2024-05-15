class Nutrient {
  final String name;
  final double amount;
  final String unit;

  Nutrient({
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      name: json['name'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }
}

class Recipe {
  final int id;
  final String title;
  final String imageUrl;
  final List<Nutrient> nutrients;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.nutrients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var nutritionJson = json['nutrition'];
    List<Nutrient> nutrients = nutritionJson != null
        ? (nutritionJson['nutrients'] as List)
        .map((nutrientJson) => Nutrient.fromJson(nutrientJson as Map<String, dynamic>))
        .toList()
        : [];
    return Recipe(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      nutrients: nutrients,
    );
  }
}