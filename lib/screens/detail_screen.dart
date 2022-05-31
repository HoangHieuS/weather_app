import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/widget/widget.dart';

class DetailScreen extends StatefulWidget {
  final dailyWeatherForecast;

  const DetailScreen({Key? key, this.dailyWeatherForecast}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Constants _constants = Constants();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var weatherData = widget.dailyWeatherForecast;

    Map getWeatherForecast(int index) {
      int maxWindSpeed = weatherData[index]['day']['maxwind_kph'].toInt();
      int avgHumidity = weatherData[index]['day']['avghumidity'].toInt();
      int chanceOfRain =
          weatherData[index]['day']['daily_chance_of_rain'].toInt();

      var parsedData = DateTime.parse(weatherData[index]['date']);
      var forecastDate = DateFormat('EEE, d MMM').format(parsedData);

      String weatherName = weatherData[index]['day']['condition']['text'];
      String weatherIcon =
          '${weatherName.replaceAll(' ', '').toLowerCase()}.png';

      int minTemperature = weatherData[index]['day']['mintemp_c'].toInt();
      int maxTemperature = weatherData[index]['day']['maxtemp_c'].toInt();

      var forecastData = {
        'forecastDate': forecastDate,
        'weatherIcon': weatherIcon,
        'weatherName': weatherName,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature,
        'maxWindSpeed': maxWindSpeed,
        'avgHumidity': avgHumidity,
        'chanceOfRain': chanceOfRain,
      };
      return forecastData;
    }

    return Scaffold(
      backgroundColor: _constants.primaryColor,
      appBar: AppBar(
        title: const Text('Forecasts'),
        centerTitle: true,
        backgroundColor: _constants.primaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height * .75,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    right: 20,
                    left: 20,
                    child: Container(
                      height: 300,
                      width: size.width * .7,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          colors: [
                            Color(0xFFA9C1F5),
                            Color(0xFF6696F5),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.1),
                            blurRadius: 3,
                            offset: const Offset(0, 25),
                            spreadRadius: -10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40,
                            left: 20,
                            width: 150,
                            child: Image.asset(
                                'assets/${getWeatherForecast(0)['weatherIcon']}'),
                          ),
                          Positioned(
                            top: 120,
                            left: 35,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                getWeatherForecast(0)['weatherName'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              width: size.width * .8,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherItem(
                                    value:
                                        getWeatherForecast(0)['maxWindSpeed'],
                                    unit: 'km/h',
                                    imageUrl: 'assets/windspeed.png',
                                  ),
                                  WeatherItem(
                                    value: getWeatherForecast(0)['avgHumidity'],
                                    unit: '%',
                                    imageUrl: 'assets/humidity.png',
                                  ),
                                  WeatherItem(
                                    value:
                                        getWeatherForecast(0)['chanceOfRain'],
                                    unit: '%',
                                    imageUrl: 'assets/lightrain.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: BigTemperature(
                                text: getWeatherForecast(0)['maxTemperature']
                                    .toString()),
                          ),
                          Positioned(
                            top: 320,
                            left: 0,
                            child: SizedBox(
                              height: 400,
                              width: size.width * .9,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Card(
                                    elevation: 3,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                getWeatherForecast(
                                                    0)['forecastDate'],
                                                style: const TextStyle(
                                                    color: Color(0xFF6696F5),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Row(
                                                children: [
                                                  SmallTemperature(
                                                    textSize: 30,
                                                    text: getWeatherForecast(
                                                            0)['minTemperature']
                                                        .toString(),
                                                    subTextSize: 20,
                                                    color: _constants.greyColor,
                                                  ),
                                                  SmallTemperature(
                                                    textSize: 30,
                                                    text: getWeatherForecast(
                                                            0)['maxTemperature']
                                                        .toString(),
                                                    subTextSize: 20,
                                                    color:
                                                        _constants.blackColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/${getWeatherForecast(0)['weatherIcon']}',
                                                    width: 30,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    getWeatherForecast(
                                                        0)['weatherName'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${getWeatherForecast(0)['chanceOfRain']}%',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Image.asset(
                                                    'assets/lightrain.png',
                                                    width: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 3,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                getWeatherForecast(
                                                    1)['forecastDate'],
                                                style: const TextStyle(
                                                    color: Color(0xFF6696F5),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Row(
                                                children: [
                                                  SmallTemperature(
                                                    textSize: 30,
                                                    text: getWeatherForecast(
                                                            1)['minTemperature']
                                                        .toString(),
                                                    subTextSize: 20,
                                                    color: _constants.greyColor,
                                                  ),
                                                  SmallTemperature(
                                                    textSize: 30,
                                                    text: getWeatherForecast(
                                                            1)['maxTemperature']
                                                        .toString(),
                                                    subTextSize: 20,
                                                    color:
                                                        _constants.blackColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/${getWeatherForecast(1)['weatherIcon']}',
                                                    width: 30,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    getWeatherForecast(
                                                        1)['weatherName'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${getWeatherForecast(1)['chanceOfRain']}%',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Image.asset(
                                                    'assets/lightrain.png',
                                                    width: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 3,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                getWeatherForecast(
                                                    2)['forecastDate'],
                                                style: const TextStyle(
                                                    color: Color(0xFF6696F5),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Row(
                                                children: [
                                                  SmallTemperature(
                                                    textSize: 30,
                                                    text: getWeatherForecast(
                                                            2)['minTemperature']
                                                        .toString(),
                                                    subTextSize: 20,
                                                    color: _constants.greyColor,
                                                  ),
                                                  SmallTemperature(
                                                    textSize: 30,
                                                    text: getWeatherForecast(
                                                            2)['maxTemperature']
                                                        .toString(),
                                                    subTextSize: 20,
                                                    color:
                                                        _constants.blackColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/${getWeatherForecast(2)['weatherIcon']}',
                                                    width: 30,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    getWeatherForecast(
                                                        2)['weatherName'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${getWeatherForecast(2)['chanceOfRain']}%',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Image.asset(
                                                    'assets/lightrain.png',
                                                    width: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
