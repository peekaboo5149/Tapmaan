import 'package:tapmaan/controller/location.dart';

import 'networking.dart';

class GetWeatherData {
  bool isFromSearch;
  String city;
  GetWeatherData(this.isFromSearch, [this.city]);
  String apiKey = '9a33f4599c76434ab8e3a439104893fb';
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
