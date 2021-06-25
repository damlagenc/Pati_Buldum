import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobil_projem/models/animal.dart';

Future<List<Animal>> getAnimal() async {
  final response = await http.get(Uri.parse(
      'https://gist.githubusercontent.com/damlagenc/8216ba9015c2eee8e8499f62d4cd8d2a/raw/ea73e73b257572898be461b43fc386df58a9c338/animals.json'));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List).map((sendData) {
      return Animal.fromJson(sendData);
    }).toList();
  } else {
    throw Exception("HATA");
  }
}
