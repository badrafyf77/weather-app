import 'package:app_wther/models/weather_Model.dart';
import 'package:app_wther/providers/weather_provider.dart';
import 'package:app_wther/services/GetWeather_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class search_page extends StatelessWidget {
  String? cityName;

  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(
          'Search',
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 220,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/private_files/lf30_vvsopkae.json'),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onSubmitted: (data) async {
                    try {
                      cityName = data;

                      weatherServices service = weatherServices();

                      weatherModel weather =
                          await service.getWeather(cityName: cityName!);

                      Provider.of<weatherProvider>(context, listen: false)
                          .weatherData = weather;

                      Provider.of<weatherProvider>(context, listen: false)
                          .cityName = cityName;
                      Navigator.pop(context);
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text(
                                "Could not fetch weather data for $cityName."),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                    border: InputBorder.none,
                    hintText: 'Enter City Name',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
