import 'package:flutter_config/flutter_config.dart';
import 'package:tapmaan/controller/location.dart';

import 'networking.dart';

class GetWeatherData {
  bool isFromSearch;
  String city;
  GetWeatherData(this.isFromSearch, [this.city]);
  String apiKey = FlutterConfig.get('API_KEY').toString();
  String openWeatherUrl = 'http://api.weatherbit.io/v2.0/current';

  getLocationData() async {
    LocationService location = LocationService();
    await location.getCurrentLocation();
    String cityName = isFromSearch ? city : location.cityName;
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherUrl?city=$cityName&key=$apiKey&days=7');
    return await networkHelper.getData();
  }
}
