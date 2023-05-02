import 'dart:convert';
import 'package:app_wther/models/weather_Model.dart';
import 'package:http/http.dart' as http;

class weatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '11127ecb4c1141c392d143203231603';

  Future<weatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    weatherModel weather = weatherModel.fromjson(data);

    return weather;
  }
}
