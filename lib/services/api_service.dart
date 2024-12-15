import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List<String>> getJokeTypes() async {
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));

    if (response.statusCode == 200) {
      List<dynamic> jokeTypes = jsonDecode(response.body);
      return List<String>.from(jokeTypes);
    } else {
      throw Exception("Failed to load joke types");
    }
  }

  static Future<List<Map<String, dynamic>>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));

    if (response.statusCode == 200) {
      List<dynamic> jokes = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jokes);
    } else {
      throw Exception("Failed to load jokes");
    }
  }

  static Future<Map<String, dynamic>> getRandomJoke() async {
    final response = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

    if (response.statusCode == 200) {
      // Return the JSON decoded response as a Map<String, dynamic>
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load random joke");
    }
  }
}
