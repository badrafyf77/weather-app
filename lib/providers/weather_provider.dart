import 'package:app_wther/models/weather_Model.dart';
import 'package:flutter/material.dart';

class weatherProvider extends ChangeNotifier {
  weatherModel? _weatherData;

  String? cityName;
  String? weatherImage;
  set weatherData(weatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weatherModel? get weatherData => _weatherData;
}
