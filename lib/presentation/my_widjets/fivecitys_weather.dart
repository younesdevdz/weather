import 'package:flutter/material.dart';
import 'package:weather/presentation/weather/weather_viewmodel.dart';

import '../../domain/weathermodels/current_weather.dart';

Widget fiveCitysWidjet(WeatherViewModel viewModel) {
  return StreamBuilder<List<CurrentWeather>>(
    stream: viewModel.outputsFivedayweather,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final currentWeather = snapshot.data!;
        return Container(
          height: MediaQuery.of(context).size.height * 0.17,
          // color: Colors.black,
          //alignment: Alignment.topCenter,
          //padding: EdgeInsets.all(5),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentWeather.length,
            itemBuilder: (context, index) {
              final item = currentWeather[index];
              return Center(
                  child: Container(
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(children: [
                  Text(item.city.toString(),
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(
                      "${(item.mainWeather!.temp! - 273.15).round().toString()}\u2103",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  Image.network(
                    "https://openweathermap.org/img/wn/${item.weather!.icon}@2x.png",
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                  Text(item.weather!.description.toString(),
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.fade,
                      )),
                ]),
              ));
            },
            separatorBuilder: (BuildContext context, int index) =>
                VerticalDivider(
              color: Colors.transparent,
              width: 10,
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
