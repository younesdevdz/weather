// "temp": 291.99,
//   "feels_like": 291.81,
//   "temp_min": 291.99,
//   "temp_max": 291.99,
//   "pressure": 1022,
//   "humidity": 72

class MainWeather {
  dynamic? temp, feelsLike, tempMin, tempMax;
  MainWeather({this.feelsLike, this.temp, this.tempMax, this.tempMin});

  factory MainWeather.fromjson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json["temp"],
      feelsLike: json["feels_like"],
      tempMax: json["temp_max"],
      tempMin: json["temp_min"],
    );
  }
}
