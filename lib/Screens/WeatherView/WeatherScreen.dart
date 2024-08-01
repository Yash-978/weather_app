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
        drawer: Drawer(
          key: drawer.key,
          backgroundColor: Colors.transparent,
          child: Container(
            height: h * 1,
            width: w * 1,
            child: ListView(
              children: [
                SizedBox(
                  height: h * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: w * 0.65,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        onFieldSubmitted: (value) {
                          weatherProviderFalse.searchWeather(value);
                        },
                        controller: txtSearch,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search, color: Colors.white),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weatherProviderFalse.clearField();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Search Weather',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )),
                      Text(
                        'My Favorite',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.05,
                )
              ],
            ),
          ).asGlass(blurX: 2, blurY: 2, tintColor: Colors.white),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.list),
        //   ),
        //   title: TextFormField(
        //     onFieldSubmitted: (value) {
        //       weatherProviderFalse.searchWeather(value);
        //     },
        //     controller: txtSearch,
        //     cursorColor: Colors.black,
        //     decoration: InputDecoration(
        //       suffixIcon: GestureDetector(
        //         onTap: () {
        //           weatherProviderFalse.clearField();
        //         },
        //         child: const Icon(Icons.close),
        //       ),
        //       prefixIcon: const Icon(Icons.search),
        //       hintText: 'Search Weather',
        //       hintStyle: const TextStyle(color: Colors.grey),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10),
        //         borderSide: const BorderSide(
        //           color: Colors.black,
        //           width: 1,
        //         ),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10),
        //         borderSide: const BorderSide(
        //           color: Colors.black,
        //           width: 1,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        body: FutureBuilder(
          future: weatherProviderFalse.fromApi(weatherProviderFalse.search),
          builder: (context, snapshot) {
            WeatherModel? weatherData = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                height: h * 1,
                width: w * 1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Gifs/weather1.gif'),
                )),
                child: SizedBox(
                  width: w * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * 0.02,
                          ),
                          IconButton(
                              onPressed: () {
                                // showSearch(context: context, delegate: );
                                // showMenu(context: context, position: RelativeRect.fromDirectional(textDirection: TextDirection.ltr, start:BorderSide.strokeAlignInside, top: top, end: end, bottom: bottom), items: items)
                              },
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                          Text(
                            weatherProviderTrue.search,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: w * 0.020,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_off,
                                color: Colors.white,
                              )),
                          Spacer(),
                          Text(
                            weatherData!.currentModal.temp_c.toString() + ' C',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            width: w * 0.05,
                          ),
                        ],
                      ),
                      Container(
                        height: h * 0.2,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.transparent)),
                        child: Text(
                            weatherData.currentModal.temp_c.toString() + ' C',
                            style:
                                TextStyle(color: Colors.white, fontSize: 80)),
                      ).asGlass(blurX: 2, blurY: 2, tintColor: Colors.black54),
                      Text(
                        weatherData.currentModal.condition.text,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        weatherData.currentModal.cloud.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        weatherData.currentModal.pressure_in.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        weatherData.currentModal.uv.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        weatherData.locationModal.localtime,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        child: Text(
                          weatherData.locationModal.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
