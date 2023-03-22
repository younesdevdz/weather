// import 'package:dio/dio.dart';
// import 'package:weather/domain/weathermodels/current_weather.dart';

// import '../repository/weather_api_repo.dart';

// class WeatherService {
//   final String? city;
//   String baseUrl = "https://api.openweathermap.org/data/2.5";
//   String apiKey = "43ea6baaad7663dc17637e22ee6f78f2";
//   WeatherService({this.city});

//   Future<CurrentWeather> getCurrentWeather(String city) async {
//     var response = await Dio().get("$baseUrl/weather?q=$city&appid=$apiKey");
//     if (response.statusCode == 200) {
//       return CurrentWeather.fromJson(response.data);
//     } else {
//       throw Exception('Failed to load current weather data');
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:weather/domain/weathermodels/current_weather.dart';
import 'package:weather/domain/weathermodels/five_dayforcast.dart';

import '../repository/weather_api_repo.dart';

class WeatherService {
  final String? city;
  String baseUrl = "https://api.openweathermap.org/data/2.5";
  String apiKey = "43ea6baaad7663dc17637e22ee6f78f2";
  WeatherService({this.city});

  Future<CurrentWeather> getCurrentWeather(String city) async {
    // var response = await Dio().get("$baseUrl/weather?q=$city&appid=$apiKey");
    var response = await WeatherApiRepository(
            url: "$baseUrl/weather?q=$city&appid=$apiKey")
        .get() as Response;
    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(response.data);
    } else {
      throw Exception('Failed to load current weather data');
    }
  }

  Future<List<FiveDayForcast>> getFiveDayForcast(String city) async {
    var response = await WeatherApiRepository(
            url: "$baseUrl/forecast?q=$city&appid=$apiKey")
        .get() as Response;
    if (response.statusCode == 200) {
      List<dynamic> dynamicList = response.data["list"];
      List<FiveDayForcast> forecastList =
          dynamicList.map((item) => FiveDayForcast.fromjson(item)).toList();
      return forecastList;
    } else {
      throw Exception('Failed to load current weather data');
    }
  }
}


//           days.daysweather.map((e) => DayWeatherModel.fromJson(e)).toList();