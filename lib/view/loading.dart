import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tapmaan/controller/get_weather_data.dart';
import 'package:tapmaan/models/weather.dart';
import 'package:tapmaan/view/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await GetWeatherData(false).getLocationData();
    Weather weatherModel = Weather.fromJson(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weather: weatherModel);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C1230),
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
