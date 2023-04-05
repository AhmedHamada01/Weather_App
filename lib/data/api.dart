import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/model.dart';

class WeatherService
{

  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "5811d3b615a24e5db9e190610230104";


  Future<WeatherModel> getWeather ({required String cityName,}) async
  {
    Uri Url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3");
    http.Response response = await http.get(Url);

    Map<String ,dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromjson(data);
    return weather ;

  }
}