import 'package:weather/domain/weathermodels/main_weather.dart';
import 'package:weather/domain/weathermodels/weather_model.dart';
import 'package:weather/domain/weathermodels/wind.dart';

class CurrentWeather {
  Wind? wind;
  Weather? weather;
  MainWeather? mainWeather;
  int? visibility, dt;
  String? city;

  CurrentWeather(
      {this.mainWeather,
      this.visibility,
      this.weather,
      this.wind,
      this.dt,
      this.city});
  factory CurrentWeather.fromJson(dynamic json) {
    return CurrentWeather(
        wind: Wind.fromjson(json["wind"]),
        weather: Weather.fromjson(json["weather"][0]),
        mainWeather: MainWeather.fromjson(json["main"]),
        visibility: json["visibility"],
        dt: json["dt"],
        city: json["name"]);
  }
}
