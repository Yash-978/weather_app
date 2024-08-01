import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';

import '../WeatherModel/weatherModel.dart';
import '../WeatherProvider/weatherProvider.dart';
import 'HomePage.dart';

Drawer drawer = Drawer();
// List destinations = [
//   ('Messages', Icon(Icons.widgets_outlined), Icon(Icons.widgets)),
//   ('Profile', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint)),
//   ('Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
// ];

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue =
        Provider.of<WeatherProvider>(context, listen: true);
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: true);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(scrolledUnderElevation: 0.1,
          centerTitle: true,
          backgroundColor:Color(0xff87A0C9),
          title: Text(
            'Favorite Places',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
        body: Flexible(
          child: ListView.builder(
            itemCount: weatherProviderTrue.weather.length,
            itemBuilder: (context, index) {
              final name = weatherProviderTrue.weather[index]
                  .split('-')
                  .sublist(0, 1)
                  .join('-');
              final temp = weatherProviderTrue.weather[index]
                  .split('-')
                  .sublist(1, 2)
                  .join('-');
              final status = weatherProviderTrue.weather[index]
                  .split('-')
                  .sublist(2, 3)
                  .join('-');
              return Card(
                color: Color(0xff87A0C9),
                // color: Colors.cyan.shade50,
                child: ListTile(
                  // title: Text(weatherProviderTrue.weather[index].split('-').sublist(0,1).join('-'),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 24),),
                  //  trailing : Text(weatherProviderTrue.weather[index].split('-').sublist(2,3).join('-'),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 21),),),
                  title: Text('${name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24)),
                  subtitle: Text('${status}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 21)),
                  trailing: Text('${temp}°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 38)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
