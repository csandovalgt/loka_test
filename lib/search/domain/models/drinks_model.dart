import 'dart:convert';

class DrinksModel {
  List<DrinkModel> drinks;

  DrinksModel({required this.drinks});

  factory DrinksModel.fromJson(String str) {
    List<DrinkModel> myDrinks = List<DrinkModel>.from(
        json.decode(str).map((x) => DrinkModel.fromJson(x)));
    return DrinksModel(
      drinks: myDrinks,
    );
  }
}

class DrinkModel {
  String name;
  String glass;
  String category;
  List<IngredientModel> ingredients;
  String? preparation;

  DrinkModel(
      {required this.name,
      required this.glass,
      required this.category,
      required this.ingredients,
      required this.preparation});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    var list = json['ingredients'] as List;
    List<IngredientModel> items =
        list.map((i) => IngredientModel.fromJson(i)).toList();

    return DrinkModel(
      name: json['name'] ?? "",
      glass: json['glass'] ?? 0.0,
      category: json['category'] ?? "",
      ingredients: items,
      preparation: json['preparation'] ?? "",
    );
  }
}

class IngredientModel {
  String? unit;
  double? amount;
  String? ingredient;
  String? special;

  IngredientModel({this.unit, this.amount, this.ingredient, this.special});

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      unit: json['unit'] ?? "",
      amount: json['amount'] !=null ? json['amount']*1.0 : 0.0,
      ingredient: json['ingredient'] ?? "",
      special: json['special'] ?? "",
    );
  }
}
