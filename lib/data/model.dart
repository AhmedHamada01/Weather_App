import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  String icon;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.icon,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });


  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
      date: data["location"]["localtime"],
      icon: data["current"]["condition"]["icon"],
      temp: jsonData["avgtemp_c"],
      maxTemp: jsonData["maxtemp_c"],
      minTemp: jsonData["mintemp_c"],
      weatherStateName: jsonData["condition"]["text"],
    );
  }

  String getImage (){
    if(weatherStateName == "Sunny"){
      return "assets/images/thunderstorm.png";
    }else if (weatherStateName == "Clear" || weatherStateName== "Light Cloud"){
      return "assets/images/clear.png";
    }else if (weatherStateName == "Overcast" || weatherStateName== "Snow"|| weatherStateName== "Hail"){
      return "assets/images/cloudy.png";
    }else if ( weatherStateName== "Heavy Cloud"){
      return "assets/images/cloudy.png";
    }else if (weatherStateName == "Heavy Rain" || weatherStateName== "Light Rain" || weatherStateName== "Showers"){
      return "assets/images/rainy.png";
    }else{
      return "assets/images/rainy.png";
    }
  }
  MaterialColor getThemeColor (){
    if(weatherStateName == "Sunny"){
      return Colors.orange;
    }else if (weatherStateName == "Clear" || weatherStateName== "Light Cloud"){
      return Colors.blue;
    }else if (weatherStateName == "Sleet" || weatherStateName== "Snow"|| weatherStateName== "Hail"){
      return Colors.grey;
    }else if ( weatherStateName== "Heavy Cloud"){
      return Colors.brown;
    }else if (weatherStateName == "Heavy Rain" || weatherStateName== "Light Rain" || weatherStateName== "Showers"){
      return Colors.deepPurple;
    }else{
      return Colors.amber;
    }
  }
}
