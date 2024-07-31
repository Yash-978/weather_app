// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);
import 'package:flutter/material.dart';
import 'dart:convert';

class WeatherModel {
  late Location location;
  late Current current;

  WeatherModel({required this.location, required this.current});

  factory WeatherModel.fromJson(Map json) {
    return WeatherModel(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }
}

class Location {
  late String name, region, country, tzId, localtime;
  late double lat, lon;
  late double localtimeEpoch;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map m1) {
    return Location(
      name: m1['name'],
      region: m1['region'],
      country: m1['country'],
      lat: m1['lat'],
      lon: m1['lon'],
      tzId: m1['tz_id'],
      localtimeEpoch: m1['localtime_epoch'],
      localtime: m1['localtime'],
    );
  }
}

class Current {
  late double lastUpdatedEpoch, isDay, windDegree, humidity, cloud, uv;
  late String lastUpdated, windDir;
  late double tempC, tempF, windMph, windKph, pressureMb, pressureIn, precipMm,
      precipIn, feelslikeC, feelslikeF, windchillC, windchillF, heatindexC,
      heatindexF, dewpointC, dewpointF, visKm, visMiles, gustMph, gustKph;
  late Condition condition;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory Current.fromJson(Map m1) {
    return Current(
      lastUpdatedEpoch: m1['last_updated_epoch'],
      lastUpdated: m1['last_updated'],
      tempC: m1['temp_c'],
      tempF: m1['temp_f'],
      isDay: m1['is_day'],
      condition: Condition.fromJson(m1['condition']),
      windMph: m1['wind_mph'],
      windKph: m1['wind_kph'],
      windDegree: m1['wind_degree'],
      windDir: m1['wind_dir'],
      pressureMb: m1['pressure_mb'],
      pressureIn: m1['pressure_in'],
      precipMm: m1['precip_mm'],
      precipIn: m1['precip_in'],
      humidity: m1['humidity'],
      cloud: m1['cloud'],
      feelslikeC: m1['feelslike_c'],
      feelslikeF: m1['feelslike_f'],
      windchillC: m1['windchill_c'],
      windchillF: m1['windchill_f'],
      heatindexC: m1['heatindex_c'],
      heatindexF: m1['heatindex_f'],
      dewpointC: m1['dewpoint_c'],
      dewpointF: m1['dewpoint_f'],
      visKm: m1['vis_km'],
      visMiles: m1['vis_miles'],
      uv: m1['uv'],
      gustMph: m1['gust_mph'],
      gustKph: m1['gust_kph'],
    );
  }
}

class Condition {
  late String text, icon;
  late double code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map m1) {
    return Condition(
      text: m1['text'],
      icon: m1['icon'],
      code: m1['code'],
    );
  }
}


//
// class WeatherModel {
//   Location location;
//   Current current;
//
//   WeatherModel({
//     required this.location,
//     required this.current,
//   });
//
//   factory WeatherModel.fromJson(Map json) => WeatherModel(
//     location: Location.fromJson(json["location"]),
//     current: Current.fromJson(json["current"]),
//   );
//
//
// }
//
// class Current {
//   int lastUpdatedEpoch;
//   String lastUpdated;
//   double tempC;
//   double tempF;
//   int isDay;
//   Condition condition;
//   double windMph;
//   double windKph;
//   int windDegree;
//   String windDir;
//   int pressureMb;
//   double pressureIn;
//   int precipMm;
//   int precipIn;
//   int humidity;
//   int cloud;
//   double feelslikeC;
//   int feelslikeF;
//   double windchillC;
//   int windchillF;
//   double heatindexC;
//   int heatindexF;
//   double dewpointC;
//   double dewpointF;
//   int visKm;
//   int visMiles;
//   int uv;
//   double gustMph;
//   double gustKph;
//
//   Current({
//     required this.lastUpdatedEpoch,
//     required this.lastUpdated,
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windMph,
//     required this.windKph,
//     required this.windDegree,
//     required this.windDir,
//     required this.pressureMb,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.precipIn,
//     required this.humidity,
//     required this.cloud,
//     required this.feelslikeC,
//     required this.feelslikeF,
//     required this.windchillC,
//     required this.windchillF,
//     required this.heatindexC,
//     required this.heatindexF,
//     required this.dewpointC,
//     required this.dewpointF,
//     required this.visKm,
//     required this.visMiles,
//     required this.uv,
//     required this.gustMph,
//     required this.gustKph,
//   });
//
//   factory Current.fromJson(Map json) {
//     return Current(
//       lastUpdatedEpoch: json["last_updated_epoch"],
//       lastUpdated: json["last_updated"],
//       tempC: json["temp_c"]?.toDouble(),
//       tempF: json["temp_f"],
//       isDay: json["is_day"],
//       condition: Condition.fromJson(json["condition"]),
//       windMph: json["wind_mph"]?.toDouble(),
//       windKph: json["wind_kph"]?.toDouble(),
//       windDegree: json["wind_degree"],
//       windDir: json["wind_dir"],
//       pressureMb: json["pressure_mb"],
//       pressureIn: json["pressure_in"]?.toDouble(),
//       precipMm: json["precip_mm"],
//       precipIn: json["precip_in"],
//       humidity: json["humidity"],
//       cloud: json["cloud"],
//       feelslikeC: json["feelslike_c"]?.toDouble(),
//       feelslikeF: json["feelslike_f"],
//       windchillC: json["windchill_c"]?.toDouble(),
//       windchillF: json["windchill_f"],
//       heatindexC: json["heatindex_c"]?.toDouble(),
//       heatindexF: json["heatindex_f"],
//       dewpointC: json["dewpoint_c"]?.toDouble(),
//       dewpointF: json["dewpoint_f"]?.toDouble(),
//       visKm: json["vis_km"],
//       visMiles: json["vis_miles"],
//       uv: json["uv"],
//       gustMph: json["gust_mph"]?.toDouble(),
//       gustKph: json["gust_kph"]?.toDouble(),
//     );
//   }
//
//   Map toJson() => {
//     "last_updated_epoch": lastUpdatedEpoch,
//     "last_updated": lastUpdated,
//     "temp_c": tempC,
//     "temp_f": tempF,
//     "is_day": isDay,
//     "condition": condition.toJson(),
//     "wind_mph": windMph,
//     "wind_kph": windKph,
//     "wind_degree": windDegree,
//     "wind_dir": windDir,
//     "pressure_mb": pressureMb,
//     "pressure_in": pressureIn,
//     "precip_mm": precipMm,
//     "precip_in": precipIn,
//     "humidity": humidity,
//     "cloud": cloud,
//     "feelslike_c": feelslikeC,
//     "feelslike_f": feelslikeF,
//     "windchill_c": windchillC,
//     "windchill_f": windchillF,
//     "heatindex_c": heatindexC,
//     "heatindex_f": heatindexF,
//     "dewpoint_c": dewpointC,
//     "dewpoint_f": dewpointF,
//     "vis_km": visKm,
//     "vis_miles": visMiles,
//     "uv": uv,
//     "gust_mph": gustMph,
//     "gust_kph": gustKph,
//   };
// }
//
// class Condition {
//   String text;
//   String icon;
//   int code;
//
//   Condition({
//     required this.text,
//     required this.icon,
//     required this.code,
//   });
//
//   factory Condition.fromJson(Map json) => Condition(
//     text: json["text"],
//     icon: json["icon"],
//     code: json["code"],
//   );
//
//   Map toJson() => {
//     "text": text,
//     "icon": icon,
//     "code": code,
//   };
// }
//
// class Location {
//   String name;
//   String region;
//   String country;
//   double lat;
//   double lon;
//   String tzId;
//   int localtimeEpoch;
//   String localtime;
//
//   Location({
//     required this.name,
//     required this.region,
//     required this.country,
//     required this.lat,
//     required this.lon,
//     required this.tzId,
//     required this.localtimeEpoch,
//     required this.localtime,
//   });
//
//   factory Location.fromJson(Map json) => Location(
//     name: json["name"],
//     region: json["region"],
//     country: json["country"],
//     lat: json["lat"]?.toDouble(),
//     lon: json["lon"]?.toDouble(),
//     tzId: json["tz_id"],
//     localtimeEpoch: json["localtime_epoch"],
//     localtime: json["localtime"],
//   );
//
//   Map toJson() => {
//     "name": name,
//     "region": region,
//     "country": country,
//     "lat": lat,
//     "lon": lon,
//     "tz_id": tzId,
//     "localtime_epoch": localtimeEpoch,
//     "localtime": localtime,
//   };
// }