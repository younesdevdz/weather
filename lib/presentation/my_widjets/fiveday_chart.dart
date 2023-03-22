import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/domain/services/weather_service.dart';
import 'package:weather/domain/weathermodels/five_dayforcast.dart';

import '../weather/weather_viewmodel.dart';

Widget chart(WeatherViewModel viewModel) {
  return StreamBuilder(
    stream: viewModel.outputsFiveDayForcast,
    builder:
        (BuildContext context, AsyncSnapshot<List<FiveDayForcast>> snapshot) {
      if (snapshot.hasData) {
        final forcast = snapshot.data!;
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.23,
          child: Container(
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
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<FiveDayForcast, String>>[
                SplineSeries<FiveDayForcast, String>(
                  color: Colors.grey,
                  dataSource: forcast,
                  xValueMapper: (FiveDayForcast f, _) => f.dateTime,
                  yValueMapper: (FiveDayForcast f, _) => f.temp,
                ),
              ],
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
