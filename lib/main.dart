import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/WeatherProvider/weatherProvider.dart';

import 'Screens/WeatherView/HomePage.dart';
import 'Screens/WeatherView/WeatherScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        // initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomePage(),
          '/weather':(context)=>WeatherPage(),
        },
      ),
    );
  }
}
