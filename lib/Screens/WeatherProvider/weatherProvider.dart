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
  List<WeatherModel> weatherList = [];

  // String weather='';
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

  Future<WeatherModel?> fromApi(String weatherInfo) async {
    final data = await apiHelper.fetchApiWeatherData(search);
    weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }

  Future<void> addFavCity(String name, String temp, String type) async {
    String data = '$name-$temp-$type';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather.add(data);
    // weather.clear();
    sharedPreferences.setStringList('weather', weather);
    notifyListeners();
  }

  Future<void> getFavouriteWeather() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather = sharedPreferences.getStringList('weather') ?? <String>[];
    notifyListeners();
  }

  // Future<void> delete(int index) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   weatherList.removeAt(index);
  //   sharedPreferences.setStringList('weather', weather);
  //   notifyListeners();
  //
  //
  // }
  Future<void> delete(int index)
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather.removeAt(index);
    sharedPreferences.setStringList('weather', weather);
    notifyListeners();
  }


  // void deleteFavoriteData(int index){
  //   weatherList.removeAt(index);
  //   notifyListeners();
  // }

  WeatherProvider() {
    getFavouriteWeather();
    // delete(index);
  }
}
