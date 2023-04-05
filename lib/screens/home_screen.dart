import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/model.dart';
import 'package:weather_app/provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class Homescreen extends StatefulWidget {

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  void upDateUi (){
    setState(() {

    });
  }
  WeatherModel ? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>SearchScreen(
                      upDateUi: upDateUi,
                    )));
              },
              icon: Icon(Icons.search) ,
          ),
        ],
      ),
      body: weatherData == null ?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Spacer(flex: 2,),
             Text(
              'There is no weather 🙂 statr	',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              ),
            ),
             SizedBox(
              height: 10.0,
            ),
            Text(
              'Searching now 🔍',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500
              ),
            ),
            Spacer(flex: 2,)
          ],
        ),
      ) : Container(
        color: weatherData!.getThemeColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const  Spacer(flex: 3,),
            Text(
                Provider.of<weatherProvider>(context).cityName,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              " Updated : ",
              style: TextStyle(
                  fontSize: 20.0,
                fontWeight: FontWeight.w400
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  weatherData!.getImage(),
                ),
                Text(
                  "${weatherData!.temp.toInt()}",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp : ${weatherData!.maxTemp.toInt()}',
                    ),
                    Text(
                      'MinTemp : ${weatherData!.minTemp.toInt()}',
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              weatherData!.weatherStateName,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Spacer(flex: 5,)
          ],
        ),
      ),
    );
  }
}
