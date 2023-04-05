import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/model.dart';
import 'package:weather_app/provider.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context) {
        return weatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<weatherProvider>(context).weatherData?.getThemeColor(),
        //brightness: Brightness.dark ,
      ),
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
