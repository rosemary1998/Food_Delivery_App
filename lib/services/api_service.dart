import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';


  static Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories.php'));
    //print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<dynamic>> fetchFoodItems(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['meals'];
    } else {
      throw Exception('Failed to load food items');
    }
  }
}
