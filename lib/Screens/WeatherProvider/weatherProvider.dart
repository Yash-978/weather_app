import 'package:flutter/material.dart';
import 'package:weather_app/Screens/WeatherModel/weatherModel.dart';
import 'package:weather_app/Utils/ApiHelper/WeatherApiHelper.dart';
class WeatherProvider extends ChangeNotifier{
  WeatherApiHelper apiHelper=WeatherApiHelper();
  WeatherModel? weatherModel;
  String search ='Surat';
  Future<WeatherModel?> fromApi() async {
    final data = await apiHelper.fetchApiWeatherData(search);
    weatherModel= WeatherModel.fromJson(data);
    return weatherModel;

  }



}