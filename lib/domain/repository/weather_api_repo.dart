import 'package:dio/dio.dart';

class WeatherApiRepository {
  final String? url;
  final Map<String, dynamic>? payload;

  WeatherApiRepository({this.payload, this.url});

  final Dio _dio = Dio();

  Future<dynamic> get() async {
    try {
      if (url == null) {
        throw Exception('URL cannot be null.');
      }

      final response = await _dio.get(url!, queryParameters: payload);
     
      return response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
