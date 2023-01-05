import 'package:http/http.dart' as http;
import 'package:cantinaisec/models/menu.dart';
import 'dart:convert';

class MenuAPI {
  static Future<Map<String, dynamic>> fetchMenu() async {
    final response = await http.get(Uri.parse("http://94.61.156.105:8080/menu"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load menu');
    }
  }
}