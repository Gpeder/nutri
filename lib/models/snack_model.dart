class NutritionItem {
  final String name;
  final double calories;
  final double servingSizeG;
  final double fatTotalG;
  final double fatSaturatedG;
  final double proteinG;
  final int sodiumMg;
  final int potassiumMg;
  final int cholesterolMg;
  final double carbohydratesTotalG;
  final double fiberG;
  final double sugarG;

  NutritionItem({
    required this.name,
    required this.calories,
    required this.servingSizeG,
    required this.fatTotalG,
    required this.fatSaturatedG,
    required this.proteinG,
    required this.sodiumMg,
    required this.potassiumMg,
    required this.cholesterolMg,
    required this.carbohydratesTotalG,
    required this.fiberG,
    required this.sugarG,
  });

  factory NutritionItem.fromJson(Map<String, dynamic> json) {
    return NutritionItem(
      name: json['name'],
      calories: json['calories'].toDouble(),
      servingSizeG: json['serving_size_g'].toDouble(),
      fatTotalG: json['fat_total_g'].toDouble(),
      fatSaturatedG: json['fat_saturated_g'].toDouble(),
      proteinG: json['protein_g'].toDouble(),
      sodiumMg: json['sodium_mg'],
      potassiumMg: json['potassium_mg'],
      cholesterolMg: json['cholesterol_mg'],
      carbohydratesTotalG: json['carbohydrates_total_g'].toDouble(),
      fiberG: json['fiber_g'].toDouble(),
      sugarG: json['sugar_g'].toDouble(),
    );
  }
}

class SnackModel {
  final String title;
  final String time;
  final List<NutritionItem> items;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;

  SnackModel({
    required this.title,
    required this.time,
    required this.items,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}

final List<SnackModel> dailyDietMock = [];