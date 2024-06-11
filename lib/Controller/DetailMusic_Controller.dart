import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pakaian_adat/model/music_model.dart';

class DetailMusicController {
  static Future<Music> getMusicById(String id) async {
    final String apiUrl = 'https://musik-tradisionalsumbawa.com/api/get-byid';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer your_access_token', // Gantilah dengan token akses yang valid
    };

    final Map<String, dynamic> body = {
      'id': id,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Music music = Music.fromJson(responseData['data']);
      return music;
    } else {
      throw Exception('Failed to load music by ID');
    }
  }
}
