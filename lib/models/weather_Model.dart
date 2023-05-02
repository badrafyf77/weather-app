class weatherModel {
  final String currentdate;
  final double currenttemp;
  final String currentWeatherStateName;
  final String date1;
  final double maxTemp1;
  final double minTemp1;
  final String weatherStateName1;
  final String date2;
  final double maxTemp2;
  final double minTemp2;
  final String weatherStateName2;
  final String date3;
  final double maxTemp3;
  final double minTemp3;
  final String weatherStateName3;
  final int daystate;

  weatherModel({
    required this.currentdate,
    required this.currenttemp,
    required this.currentWeatherStateName,
    required this.date1,
    required this.maxTemp1,
    required this.minTemp1,
    required this.weatherStateName1,
    required this.date2,
    required this.maxTemp2,
    required this.minTemp2,
    required this.weatherStateName2,
    required this.date3,
    required this.daystate,
    required this.maxTemp3,
    required this.minTemp3,
    required this.weatherStateName3,
  });

  factory weatherModel.fromjson(dynamic data) {
    var jsonData1 = data['forecast']['forecastday'][0];
    var jsonData2 = data['forecast']['forecastday'][1];
    var jsonData3 = data['forecast']['forecastday'][2];
    return weatherModel(
      currentdate: data['location']['localtime'],
      currenttemp: data['current']['temp_c'],
      currentWeatherStateName: data['current']['condition']['text'],
      date1: jsonData1['date'],
      maxTemp1: jsonData1['day']['maxtemp_c'],
      minTemp1: jsonData1['day']['mintemp_c'],
      weatherStateName1: jsonData1['day']['condition']['text'],
      date2: jsonData2['date'],
      maxTemp2: jsonData2['day']['maxtemp_c'],
      minTemp2: jsonData2['day']['mintemp_c'],
      weatherStateName2: jsonData2['day']['condition']['text'],
      date3: jsonData3['date'],
      maxTemp3: jsonData3['day']['maxtemp_c'],
      minTemp3: jsonData3['day']['mintemp_c'],
      weatherStateName3: jsonData3['day']['condition']['text'],
      daystate: data['current']['is_day'],
    );
  }

  var index = 0;
  String? dayORnight;

  var weatherState = [
    'Sunny',
    'Partly cloudy',
    'Cloudy',
    'Overcast',
    'Mist',
    'Patchy rain possible',
    'Patchy snow possible',
    'Patchy sleet possible',
    'Patchy freezing drizzle possible',
    'Thundery outbreaks possible',
    'Blowing snow',
    'Blizzard',
    'Fog',
    'Freezing fog',
    'Patchy light drizzle',
    'Light drizzle',
    'Freezing drizzle',
    'Heavy freezing drizzle',
    'Patchy light rain',
    'Light rain',
    'Moderate rain at times',
    'Moderate rain',
    'Heavy rain at times',
    'Heavy rain',
    'Light freezing rain',
    'Moderate or heavy freezing rain',
    'Light sleet',
    'Moderate or heavy sleet',
    'Patchy light snow',
    'Light snow',
    'Patchy moderate snow',
    'Moderate snow',
    'Patchy heavy snow',
    'Heavy snow',
    'Ice pellets',
    'Light rain shower',
    'Moderate or heavy rain shower',
    'Torrential rain shower',
    'Light sleet showers',
    'Moderate or heavy sleet showers',
    'Light snow showers',
    'Moderate or heavy snow showers',
    'Light showers of ice pellets',
    'Moderate or heavy showers of ice pellets',
    'Patchy light rain with thunder',
    'Moderate or heavy rain with thunder',
    'Patchy light snow with thunder',
    'Moderate or heavy snow with thunder'
  ];

  var weatherImage = [
    '113.png',
    '116.png',
    '119.png',
    '122.png',
    '143.png',
    '176.png',
    '179.png',
    '182.png',
    '185.png',
    '200.png',
    '227.png',
    '230.png',
    '248.png',
    '260.png',
    '263.png',
    '266.png',
    '281.png',
    '284.png',
    '293.png',
    '296.png',
    '299.png',
    '302.png',
    '305.png',
    '308.png',
    '311.png',
    '314.png',
    '317.png',
    '320.png',
    '323.png',
    '326.png',
    '329.png',
    '332.png',
    '335.png',
    '338.png',
    '350.png',
    '353.png',
    '356.png',
    '359.png',
    '362.png',
    '365.png',
    '368.png',
    '371.png',
    '374.png',
    '377.png',
    '386.png',
    '389.png',
    '392.png',
    '395.png',
  ];

  String getBackground() {
    if (daystate == 1) {
      return "assets/images/clear_day.png";
    } else if (daystate == 0) {
      return "assets/images/clear_night.png";
    } else {
      return "assets/images/clear_day.png";
    }
  }

  String getWeatherImage() {
    if (daystate == 1) {
      dayORnight = 'day';
      for (var i = 0; i < weatherState.length; i++) {
        if (currentWeatherStateName == weatherState[i]) {
          index = i;
        }
      }
    } else if (daystate == 0) {
      dayORnight = 'night';
      for (var i = 0; i < weatherState.length; i++) {
        if (currentWeatherStateName == weatherState[i]) {
          index = i;
        }
      }
    } else {
      dayORnight = 'day';
    }
    return 'assets/images/$dayORnight/${weatherImage[index]}';
  }

  String getImage1() {
    index = 0;
    for (var i = 0; i < weatherImage.length; i++) {
      if (weatherStateName1 == weatherState[i]) {
        index = i;
      }
    }
    return 'assets/images/day/${weatherImage[index]}';
  }

  String getImage2() {
    index = 0;
    for (var i = 0; i < weatherImage.length; i++) {
      if (weatherStateName2 == weatherState[i]) {
        index = i;
      }
    }
    return 'assets/images/day/${weatherImage[index]}';
  }

  String getImage3() {
    index = 0;
    for (var i = 0; i < weatherImage.length; i++) {
      if (weatherStateName3 == weatherState[i]) {
        index = i;
      }
    }
    return 'assets/images/day/${weatherImage[index]}';
  }
}
