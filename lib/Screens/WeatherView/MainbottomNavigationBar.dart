import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../WeatherProvider/weatherProvider.dart';
import 'HomePage.dart';


// List<Widget> _bottomNavigate = [
//   const HomePage(),
//   // const Giftscreen(),
//   // const CategoriesPage(),
//   // const Paymentscreen(),
//   // const Searchscreen(),
// ];
// class BottomNavigationBar extends StatelessWidget {
//
//   const BottomNavigationBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     WeatherProvider weatherProviderTrue =
//     Provider.of<WeatherProvider>(context, listen: true);
//     WeatherProvider weatherProviderFalse =
//     Provider.of<WeatherProvider>(context, listen: true);
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body:  PageView(
//         controller: weatherProviderTrue,
//         onPageChanged: weatherProviderFalse._onPageChanged,
//         children: _bottomNavigate,
//
//
//       ),
//     );
//   }
// }
