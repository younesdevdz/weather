import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/weathermodels/current_weather.dart';

Widget currentWeatherWidjet(CurrentWeather currentWeather, context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  '${currentWeather.city}',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black45,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'flutterfonts',
                      ),
                ),
              ),
              Center(
                child: Text(
                  DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black45,
                        fontSize: 16,
                        fontFamily: 'flutterfonts',
                      ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                children: <Widget>[
                  Text(
                    '${currentWeather.weather!.description}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black45,
                          fontSize: 22,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '${(currentWeather.mainWeather!.temp! - 273.15).round().toString()}\u2103',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.black45, fontFamily: 'flutterfonts'),
                  ),
                  Text(
                    'min: ${(currentWeather.mainWeather!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(currentWeather.mainWeather!.tempMax! - 273.15).round().toString()}\u2103',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.network(
                        "https://openweathermap.org/img/wn/${currentWeather.weather!.icon}@2x.png"),
                  ),
                  Container(
                    child: Text(
                      'wind ${currentWeather.wind!.speed} m/s',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
