import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/api.dart';
import 'package:weather_app/data/model.dart';
import 'package:weather_app/provider.dart';

class SearchScreen extends StatelessWidget {

  String ?cityName ;

  SearchScreen({this.upDateUi});
  VoidCallback ?upDateUi ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search a city',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data)async{
              cityName = data;

              WeatherService service = WeatherService();
             WeatherModel ?weather = await service.getWeather(cityName: cityName!);

             Provider.of<weatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<weatherProvider>(context,listen: false).cityName = cityName!;


             Navigator.pop(context);

            },
            decoration: InputDecoration(
              labelText: "search",
              hintText: "Enter a city",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              suffixIcon: InkWell(
                onTap: () async{
                  WeatherService service = WeatherService();
                  WeatherModel ?weather = await service.getWeather(cityName: cityName!);

                  Provider.of<weatherProvider>(context,listen: false).weatherData = weather;
                  Provider.of<weatherProvider>(context,listen: false).cityName = cityName!;


                  Navigator.pop(context);
                },
                child: Icon(
                    Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

