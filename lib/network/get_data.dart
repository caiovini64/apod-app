import 'dart:convert';

import 'package:apod_flutter/constants/api_key.dart';
import 'package:http/http.dart' as http;

class GetData {
  getImages() async {
    http.Response response = await http.get(
        'https://api.nasa.gov/planetary/apod?api_key=$API_KEY&date=2020-10-14');

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return result;
    } else {
      throw Exception('erro ao consumir api');
    }
  }
}
