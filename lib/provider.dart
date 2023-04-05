import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/model.dart';

class weatherProvider extends ChangeNotifier{
  WeatherModel ? _weatherData ;
 late String cityName ;

  set weatherData (WeatherModel? weather){
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel ?get weatherData => _weatherData;
}