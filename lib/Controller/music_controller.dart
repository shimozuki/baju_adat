import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pakaian_adat/model/music_model.dart';

class MusicController {
  final String apiUrl;

  MusicController(this.apiUrl);

  Future<List<Music>> getAllMusic() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((json) => Music.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load music');
    }
  }
}
