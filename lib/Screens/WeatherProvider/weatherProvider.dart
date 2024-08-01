import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Screens/WeatherModel/weatherModel.dart';
import 'package:weather_app/Screens/WeatherView/HomePage.dart';
import 'package:weather_app/Utils/ApiHelper/WeatherApiHelper.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherApiHelper apiHelper = WeatherApiHelper();
  WeatherModel? weatherModel;
  String search = 'Surat';
  PageController _pageController = PageController();
  int selectPage = 0;
  List<String> weather = [];

  void searchWeather(String weatherInfo) {
    search = weatherInfo;
    notifyListeners();
  }

  void clearField() {
    txtSearch.clear();
  }

  void _onPageChanged(int index) {
    selectPage = index;
    notifyListeners();
  }

  void _onItemTapped(int i) {
    _pageController.jumpToPage(i);
    notifyListeners();
  }

  Future<void> addToFavorite(String name, String status, double temp) async {
    String favouriteWeatherCityData = '$name,$temp,$status';
    SharedPreferences sharedPreferences1 =
        await SharedPreferences.getInstance();
    sharedPreferences1.setStringList('weather', weather);
    weather.add(favouriteWeatherCityData);
    sharedPreferences1.getStringList('weather');
  }

  // Future<void> getFavoriteWeather()
  // async {
  //   SharedPreferences sharedPreferences;
  //   weather = await sharedPreferences.getStringList('weather',weather)??<String>[];
  //
  // }
  Future<void> getFavourite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> weather =
        sharedPreferences.getStringList('weather') ?? <String>[];
    print(weather);
    notifyListeners();
  }

  Future<WeatherModel?> fromApi(String weatherInfo) async {
    final data = await apiHelper.fetchApiWeatherData(search);
    weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}
