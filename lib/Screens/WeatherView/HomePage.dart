import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/WeatherModel/weatherModel.dart';
import 'package:weather_app/Screens/WeatherProvider/weatherProvider.dart';

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
        title: Text('Weather App'),
      ),
      body: FutureBuilder(
        future: weatherProviderFalse.fromApi(),
        builder: (context, snapshot) {
          WeatherModel? weatherData = snapshot.data;

          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: h * 0.5,
                      width: w * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                    // Text(weatherData!.current.lastUpdated),
                    Text(weatherData!.current.lastUpdated),
                    Text(weatherData.current.condition.text),
                    // Text(weatherData.location.lat.toString())
                  ],
                );
              },
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
