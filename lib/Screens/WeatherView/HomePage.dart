import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/WeatherModel/weatherModel.dart';
import 'package:weather_app/Screens/WeatherProvider/weatherProvider.dart';

var txtSearch = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue =
        Provider.of<WeatherProvider>(context, listen: true);
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: true);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onFieldSubmitted: (value) {
            weatherProviderFalse.searchWeather(value);
          },
          controller: txtSearch,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                weatherProviderFalse.clearField();
              },
              child: const Icon(Icons.close),
            ),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search Weather',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: weatherProviderFalse.fromApi(weatherProviderFalse.search),
        builder: (context, snapshot) {
          WeatherModel? weatherData = snapshot.data;

          if (snapshot.hasData) {
            return ListView(
              children: [
                Container(
                  height: h * 0.5,
                  width: w * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
                Text(weatherData!.locationModal.name),
                Text(weatherData!.currentModal.condition.text),
                Text(weatherData!.currentModal.temp_c.toString())
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
