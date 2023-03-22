import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:weather/domain/weathermodels/current_weather.dart';
import 'package:weather/domain/weathermodels/five_dayforcast.dart';

import '../../domain/services/weather_service.dart';

class WeatherViewModel {
  final _weatherService = WeatherService();

  final _weatherFetcher = PublishSubject<CurrentWeather>();
  final _fiveCitysWeatherFetcher = PublishSubject<List<CurrentWeather>>();
  final _fiveDayForcast = PublishSubject<List<FiveDayForcast>>();

  void dispose() {
    _fiveCitysWeatherFetcher.close();
    _weatherFetcher.close();
  }

  Stream<CurrentWeather> get outputsweather => _weatherFetcher.stream;
  Stream<List<CurrentWeather>> get outputsFivedayweather =>
      _fiveCitysWeatherFetcher.stream;
  Stream<List<FiveDayForcast>> get outputsFiveDayForcast =>
      _fiveDayForcast.stream;

  Future<CurrentWeather> fetchWeather(String city) async {
    final weather = await _weatherService.getCurrentWeather(city);
    _weatherFetcher.sink.add(weather);
    return weather;
  }

  fetchFiveCityWeather() async {
    var citys = ["alger", "paris", "new york", "kopenhagen", "berlin"];
    List<CurrentWeather> list = [];
    citys.forEach((element) async {
      final weather = await _weatherService.getCurrentWeather(element);
      list.add(weather);
      _fiveCitysWeatherFetcher.sink.add(list);
    });
  }

  fetchfiveDayforcast(String city) async {
    final fiveDayForcast = await _weatherService.getFiveDayForcast(city);
    _fiveDayForcast.sink.add(fiveDayForcast);
  }
}
