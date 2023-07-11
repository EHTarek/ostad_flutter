import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherModel;
  late final Map<String, dynamic> map;

  Future getWeatherData() async {
    try{
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=23.8032369&lon=90.3653871&appid=b75cb551c73b6aff232bfbf3acb61e33&units=metric'));

      final Map<String, dynamic> map = jsonDecode(response.body);

      if (response.statusCode == 200 && map['status'] == 'success') {
        weatherModel = WeatherModel.fromJson(map);
        return weatherModel;
      }
      setState(() {
        print(map);
      });
    }catch(e){print(e);}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7a59f9),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff7a59f9),
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff5036a5),
                Color(0xff5036a5),
                Color(0xff8d6bc4),
              ]),
        ),
        child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    "${weatherModel?.main?.temp}°C",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
                  )),
             /* Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Text("${weatherModel?.weather?[0].description}")),
              Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Text(
                      "Feels:${weatherModel?.main?.feelsLike.toString()}°C")),
              Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Text(
                      "H:${weatherModel?.main?.tempMax.toString()}°C L:${weatherModel?.main?.tempMin.toString()}°C")),*/
            ],
          ),
      ),
    );
  }
}
