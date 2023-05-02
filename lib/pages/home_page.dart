import 'package:app_wther/models/weather_Model.dart';
import 'package:app_wther/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_wther/pages/search_page.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  weatherModel? weatherData;
  
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      backgroundColor: Color(0xFF17479B),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return search_page();
              })));
            },
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          )
        ],
        toolbarHeight: 150,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'WeatherApp',
              style: GoogleFonts.robotoCondensed(
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 100),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmn7WkUdH79NtPDRMzBh8Sr3OYglysamDDoQ&usqp=CAU',
              height: 80,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: 
        weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.network(
                      'https://assets1.lottiefiles.com/private_files/lf30_oj6pxozf.json'),
                  SizedBox(height: 15),
                  Text(
                    'Welcome to WeatherApp',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'start searching now',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 0.5,
                child: Image.asset(weatherData!.getBackground(),
              fit: BoxFit.cover,
              ),
              ),
              Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Text(Provider.of<weatherProvider>(context).cityName!,
            style: GoogleFonts.robotoCondensed(
              fontSize: 28,
              color: Colors.white,
            ),),
            Text(weatherData!.currentdate,
            style: GoogleFonts.robotoCondensed(
              fontSize: 15,
              color: Colors.white,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                margin: EdgeInsets.all(12),
                child: Column(children: [
                  Image.asset(weatherData!.getWeatherImage(),
                height: 70,),
                Text(
                  weatherData!.currentWeatherStateName,
                style: GoogleFonts.robotoCondensed(
                  fontSize: 18,
                  color: Colors.white,
                ),)
                ],),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text('${weatherData!.currenttemp.toInt()}°',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 110,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              ],
            ),
            Spacer(flex: 6,),
            Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
              ),
              height: 200.0,
              child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Center(
                    child: Text("3-day forecast",
                    style: GoogleFonts.robotoCondensed(
                      color: Color(0xFF868686),
                    ),),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(weatherData!.getImage1(),
                        height: 60,),
                        Text(weatherData!.date1,
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 11,
                          color: Colors.black,
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text('${weatherData!.maxTemp1.toInt()}° / ${weatherData!.minTemp1.toInt()}°',
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(weatherData!.getImage2(),
                        height: 60,),
                        Text(weatherData!.date2,
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 11,
                          color: Colors.black,
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text('${weatherData!.maxTemp2.toInt()}° / ${weatherData!.minTemp2.toInt()}°',
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(weatherData!.getImage3(),
                        height: 60,),
                        Text(weatherData!.date3,
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 11,
                          color: Colors.black,
                        ),),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text('${weatherData!.maxTemp3.toInt()}° / ${weatherData!.minTemp3.toInt()}°',
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ],
                      ),
                    ],
                  ),
                  //ElevatedButton(onPressed: (){
                    //onPressed code here
                  //},
                  //child: Text('3-day forecast'),)
              ],
              ),
              ),
          ],
          )
            ],
          )
    );
  }
}
