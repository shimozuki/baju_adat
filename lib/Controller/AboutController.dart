import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pakaian_adat/model/about_model.dart';

class AboutController {
  static Future<List<About_Model>> getAboutData() async {
    const int maxRetries = 3;
    int retryCount = 0;
    while (retryCount < maxRetries) {
      try {
        final response = await http.get(
          Uri.parse('https://musik-tradisionalsumbawa.com/api/get-about'),
        );

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body)['data'];
          return data.map((json) => About_Model.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load about data');
        }
      } catch (e) {
        retryCount++;
        if (retryCount == maxRetries) {
          throw Exception(
              'Failed to load about data after $maxRetries attempts: $e');
        }
      }
    }
    return [];
  }
}
