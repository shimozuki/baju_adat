import 'dart:io';

import 'package:http/http.dart' as http;

class UploadController {
  static const String apiUrl = 'https://musik-tradisionalsumbawa.com/api/upload';

  Future<void> uploadData({
    required String nama,
    required String whatsapp,
    required String email,
    required String namaAlat,
    required String imagePath,
    required String selectFile,
    required String link,
  }) async {
    try {
       File imageFile = File(imagePath);
      // Membuat request body
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['nama'] = nama
        ..fields['whatsapp'] = whatsapp
        ..fields['email'] = email
        ..fields['nama_alat'] = namaAlat
        ..fields['select_file'] = selectFile
        ..fields['link'] = link
        ..files.add(http.MultipartFile.fromBytes(
          'image',
          await imageFile.readAsBytes(),
          filename: 'image.jpg', // Provide a default filename
        ));

      // Menambahkan header yang diperlukan
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',// Gantilah dengan token yang valid
      });

      // Mengirim request dan mendapatkan response
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Data berhasil diunggah : ${request}');
      } else {
        print('Gagal mengunggah data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}
