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
  // WeatherModel? weatherModel;
  // late final Map<String, dynamic> map;
  late Future<WeatherModel> weatherData;

  Future<WeatherModel> fetchWeatherData() async {
    // final apiKey = 'b75cb551c73b6aff232bfbf3acb61e33';
    // final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=23.8032369&lon=90.3653871&appid=b75cb551c73b6aff232bfbf3acb61e33&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchWeatherData();
  // }

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
        child: Center(
          child: FutureBuilder<WeatherModel>(
            future: fetchWeatherData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.name.toString(), style: TextStyle(fontSize: 22),),
                    Text('Updated: 10:00 PM', style: TextStyle(color: Colors.white70),),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.cloud,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          '${snapshot.data!.main!.temp!.toStringAsFixed(1)}°',
                          style: const TextStyle(fontSize: 24),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'max: ${snapshot.data!.main!.tempMax!.toStringAsFixed(1)}°',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              'min: ${snapshot.data!.main!.tempMin!.toStringAsFixed(1)}°',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    Text(
                      '${snapshot.data!.weather![0].description}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
