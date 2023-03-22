import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain/weathermodels/current_weather.dart';
import 'package:weather/presentation/my_widjets/fiveday_chart.dart';
import 'package:weather/presentation/weather/weather_viewmodel.dart';

import '../my_widjets/current_weatherwidjet.dart';
import '../my_widjets/fivecitys_weather.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final WeatherViewModel _viewModel = WeatherViewModel();
  @override
  void initState() {
    super.initState();
    print("init");
    _bind();
  }

  void _bind() {
    _viewModel.fetchWeather("tindouf");
    _viewModel.fetchFiveCityWeather();
    _viewModel.fetchfiveDayforcast("tindouf");
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilder<CurrentWeather>(
              stream: _viewModel.outputsweather,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final currentWeather = snapshot.data!;
                  return Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30))),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: <Widget>[
                          currentWeatherWidjet(currentWeather, context),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(244, 243, 243, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                              onChanged: (value) {
                                _viewModel.fetchWeather(value);
                                _viewModel.fetchfiveDayforcast(value);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black87,
                                  ),
                                  hintText: "Search ",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                        ],
                      ));
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
              ),
              alignment: Alignment.bottomLeft,
              child: Text(
                "other city".toUpperCase(),
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            fiveCitysWidjet(_viewModel),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
              ),
              alignment: Alignment.bottomLeft,
              child: Text(
                "five day forcast".toUpperCase(),
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            chart(_viewModel)
          ],
        ),
      ),
    );
  }
}

//************************* */

