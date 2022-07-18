import 'package:http/http.dart' as http;
import 'package:loka_test/search/domain/models/drinks_model.dart';

class SearchServices {
  static Future<DrinksModel> fetch() async {
    try {
      var url = Uri.parse(
          'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json');
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return DrinksModel.fromJson(response.body);
      } else {
        return DrinksModel(drinks: []);
      }
    } catch (err) {
      return DrinksModel(drinks: []);
    }
  }
}
