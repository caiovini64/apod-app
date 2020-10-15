import 'dart:convert';

import 'package:apod_flutter/constants/api_key.dart';
import 'package:http/http.dart' as http;

class GetData {
  getImages(selectedDate) async {
    if (selectedDate == null) {
      http.Response response = await http
          .get('https://api.nasa.gov/planetary/apod?api_key=$API_KEY');
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return result;
      } else {
        throw Exception('erro ao consumir api');
      }
    } else {
      http.Response response = await http.get(
          'https://api.nasa.gov/planetary/apod?api_key=$API_KEY&date=${selectedDate.toString().substring(0, 10)}');
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return result;
      } else {
        throw Exception('erro ao consumir api');
      }
    }
  }
}
