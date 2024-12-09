import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<Measurement> uploadImageAndGetMeasurement(File image) async {
  final uri = Uri.parse("https://sua-api.com/upload-measurement");

  final request = http.MultipartRequest("POST", uri);

  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      image.path,
    ),
  );

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    return Measurement.fromJson(json.decode(response.body));
  } else {
    throw Exception("Não foi possível enviar a imagem e obter as medidas");
  }
}
