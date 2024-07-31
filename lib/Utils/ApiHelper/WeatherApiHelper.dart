import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class WeatherApiHelper{

  Future<Map> fetchApiWeatherData(String search)
  async {
    String api='https://api.weatherapi.com/v1/current.json?key=40550ce444b84c6c83625551243107&q=london';
    Uri url=Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode==200){
      final json=response.body;
      final data= jsonDecode(json);
      return data;
    }
    else {
      return {};
    }
  }
}