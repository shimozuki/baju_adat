import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pakaian_adat/model/sejarahumum_model.dart';

class SejarahUmumController {
  static Future<List<SejarahUmumModel>> getSejarahUmumData() async {
    final response = await http.get(
      Uri.parse('https://musik-tradisionalsumbawa.com/api/Sejarah_mumu'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => SejarahUmumModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sejarah umum data');
    }
  }
}
