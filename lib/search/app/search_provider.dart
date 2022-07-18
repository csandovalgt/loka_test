import 'package:flutter/material.dart';
import 'package:loka_test/search/domain/models/drinks_model.dart';
import 'package:loka_test/search/repository/search_services.dart';

class SearchProvider with ChangeNotifier {

  DrinksModel drinks = DrinksModel(drinks: []);
  bool isFetching = false;

  void search() async {
    isFetching = true;
    notifyListeners();

    drinks = await SearchServices.fetch();
    drinks.drinks.sort((a,b) {
      return b.name.toLowerCase().compareTo(a.name.toLowerCase());
    });
    isFetching = false;
    notifyListeners();
  }


}