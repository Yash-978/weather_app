import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
        Provider.of<WeatherProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          // key: drawer.key,
          backgroundColor: Colors.black12,
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
                        style: const TextStyle(color: Colors.white),
                        onFieldSubmitted: (value) {
                          weatherProviderFalse.searchWeather(value);
                        },
                        controller: txtSearch,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search, color: Colors.white),
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
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            // weatherProviderFalse.addToFavorite(weatherProviderTrue.weatherModel!.locationModal.name,weatherProviderTrue.weatherModel!.currentModal.);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )),
                      const Text(
                        'My Favorite',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).asGlass(blurX: 2, blurY: 2, tintColor: Colors.white),
        ),
        body: FutureBuilder(
          future: weatherProviderFalse.fromApi(weatherProviderFalse.search),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weather = snapshot.data;
              return Container(
                height: h * 1,
                width: w * 1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      (weatherProviderTrue.weatherModel!.currentModal.is_day ==
                              1)
                          ? night
                          : day),
                  // AssetImage('assets/Gifs/weather3.gif'),
                )),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 990,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage((weatherProviderTrue
                                          .weatherModel!.currentModal.is_day ==
                                      1)
                                  ? day
                                  : night),
                              fit: BoxFit.fill),
                          // color: Colors.red.shade200,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    // weatherProviderFalse.addFavCity(
                                    //     weather!.locationModal.name,
                                    //     weather.currentModal.temp_c.toString(),
                                    //     weather.currentModal.condition.text);
                                    Navigator.of(context)
                                        .pushNamed('/favorite');
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              weatherProviderTrue
                                  .weatherModel!.locationModal.name,
                              style: TextStyle(
                                  color: (weatherProviderTrue.weatherModel!
                                              .currentModal.is_day ==
                                          1)
                                      ? Colors.white
                                      : Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  height: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " ${weatherProviderTrue.weatherModel!.currentModal.temp_c}",
                                    style: TextStyle(
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.white
                                            : Colors.white,
                                        fontSize: 100,
                                        fontWeight: FontWeight.w200,
                                        height: .8,
                                        letterSpacing: -.5),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '°C',
                                        style: TextStyle(
                                          color: (weatherProviderTrue
                                                      .weatherModel!
                                                      .currentModal
                                                      .is_day ==
                                                  1)
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 55,
                                          fontWeight: FontWeight.w300,
                                          height: -.65,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Text(
                              weatherProviderTrue
                                  .weatherModel!.currentModal.condition.text,
                              style: TextStyle(
                                color: (weatherProviderTrue.weatherModel!
                                            .currentModal.is_day ==
                                        1)
                                    ? Colors.white
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: (weatherProviderTrue.weatherModel!
                                                .currentModal.is_day ==
                                            1)
                                        ? Colors.black12
                                        : Colors.black12,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, bottom: 10, top: 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Today's Forecast",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 15,),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...List.generate(
                                              weatherProviderTrue
                                                  .weatherModel!
                                                  .forecastModal
                                                  .forecastDay
                                                  .first
                                                  .hour
                                                  .length, (index) {
                                            final hour = weatherProviderTrue
                                                .weatherModel!
                                                .forecastModal
                                                .forecastDay
                                                .first
                                                .hour[index];
                                            return SizedBox(
                                                height: 120,
                                                width: 80,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 120,
                                                      width: 70,
                                                      // color: Colors.red,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            hour.time
                                                                .split(" ")
                                                                .sublist(1, 2)
                                                                .join(" "),
                                                            style: TextStyle(
                                                                color: (weatherProviderTrue
                                                                            .weatherModel!
                                                                            .currentModal
                                                                            .is_day ==
                                                                        1)
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .white,
                                                                fontSize: 18),
                                                          ),
                                                          Image.network(
                                                              'https:${hour.hourConditionModal.icon}'),
                                                          Text(
                                                            '${hour.temp_c}',
                                                            style: TextStyle(
                                                                color: (weatherProviderTrue
                                                                            .weatherModel!
                                                                            .currentModal
                                                                            .is_day ==
                                                                        1)
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .white,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      ),
                                                    ).asGlass(),
                                                  ],
                                                ));
                                          })
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ).asGlass(),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Weather Details',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.black12
                                            : Colors.black12,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'W wind',
                                              style: TextStyle(
                                                  color: (weatherProviderTrue
                                                              .weatherModel!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.white
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${weatherProviderTrue.weatherModel!.currentModal.wind_kph} km/h',
                                                style: TextStyle(
                                                    color: (weatherProviderTrue
                                                                .weatherModel!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.white
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ).asGlass(),
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.black12
                                            : Colors.black12,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Humidity',
                                              style: TextStyle(
                                                  color: (weatherProviderTrue
                                                              .weatherModel!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.white
                                                      : Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${weatherProviderTrue.weatherModel!.currentModal.humidity} %',
                                                style: TextStyle(
                                                    color: (weatherProviderTrue
                                                                .weatherModel!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.white
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ).asGlass(blurY: 5, blurX: 5),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.black12
                                            : Colors.black12,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Pressure ',
                                              style: TextStyle(
                                                  color: (weatherProviderTrue
                                                              .weatherModel!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.white
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${weatherProviderTrue.weatherModel!.currentModal.pressure_mb} mb',
                                                style: TextStyle(
                                                    color: (weatherProviderTrue
                                                                .weatherModel!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.white
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ).asGlass(),
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.black12
                                            : Colors.black12,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Visibility',
                                              style: TextStyle(
                                                  color: (weatherProviderTrue
                                                              .weatherModel!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.white
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${weatherProviderTrue.weatherModel!.currentModal.vis_km} km',
                                                style: TextStyle(
                                                    color: (weatherProviderTrue
                                                                .weatherModel!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.white
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ).asGlass(blurX: 2, blurY: 5),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.black12
                                            : Colors.black12,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Feels Like ',
                                              style: TextStyle(
                                                  color: (weatherProviderTrue
                                                              .weatherModel!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.white
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${weatherProviderTrue.weatherModel!.currentModal.feelslike_c}°',
                                                style: TextStyle(
                                                    color: (weatherProviderTrue
                                                                .weatherModel!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.white
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ).asGlass(blurY: 1, blurX: 2),
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (weatherProviderTrue
                                                    .weatherModel!
                                                    .currentModal
                                                    .is_day ==
                                                1)
                                            ? Colors.black12
                                            : Colors.black12,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Clouds  ',
                                              style: TextStyle(
                                                  color: (weatherProviderTrue
                                                              .weatherModel!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.white
                                                      : Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${weatherProviderTrue.weatherModel!.currentModal.cloud}%',
                                                style: TextStyle(
                                                    color: (weatherProviderTrue
                                                                .weatherModel!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.white
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ).asGlass(blurX: 2, blurY: 2),
                                  ],
                                ),
                              ],
                            ),
                            ActionSlider.standard(

                              onTap: (controller, pos) {
                                weatherProviderFalse.addFavCity(
                                    weather!.locationModal.name,
                                    weather.currentModal.temp_c.toString(),
                                    weather.currentModal.condition.text);
                                Navigator.of(context).pushNamed('/favorite');
                              },
                              sliderBehavior: SliderBehavior.stretch,
                              rolling: true,
                              width: w * 0.95,
                              backgroundColor: Colors.white30,
                              toggleColor: Colors.amber,
                              iconAlignment: Alignment.centerRight,
                              loadingIcon: const SizedBox(
                                  width: 55,
                                  child: Center(
                                      child: SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2.0, color: Colors.white
                                    ),
                                  ))),
                              successIcon: const SizedBox(
                                  width: 55,
                                  child:
                                      Center(child: Icon(Icons.check_rounded,color: Colors.white,))),
                              icon: const SizedBox(
                                  width: 55,
                                  child: Center(
                                      child: Icon(Icons.refresh_rounded,color: Colors.white,))),
                              action: (controller) async {
                                controller.loading(); //starts loading animation
                                await Future.delayed(const Duration(
                                    seconds: 1, milliseconds: 500));
                                controller.success(); //starts success animation
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                controller.reset(); //resets the slider
                              },
                              child: Shimmer.fromColors(
                                baseColor: Colors.black87,
                                highlightColor: Colors.white,
                                child: const Text(
                                  'Slide To Add To Favorite',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                height: h * 1,
                width: w * 1,
                decoration: const BoxDecoration(color: Colors.white),
                child: Shimmer.fromColors(
                  baseColor: Colors.black87,
                  highlightColor: Colors.white,
                  child: Container(
                    height: h * 0.95,
                    width: w * 0.98,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "Almost there! Let’s see if it’s a sunglasses or umbrella kind of day!",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ],
                    ),
                  ).asGlass(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

String day = 'assets/Gifs/weather3.gif';
String night = 'assets/Gifs/weather1.gif';
// glassmorphism: ^3.0.0
