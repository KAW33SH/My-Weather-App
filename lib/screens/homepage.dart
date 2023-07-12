import 'package:flutter/material.dart';

import '../api_controller/openweathermap_api.dart';
import '../model/weather_model.dart';

import '../helpers/home_info_widget.dart';
import '../helpers/weather_widget.dart';
import '../helpers/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;
  final TextEditingController _searchController = TextEditingController();

  String selectedCity = "Kalutara";

  void _searchCity(String city) {
    if (city.isEmpty) {
      return;
    }
    Future.delayed(Duration.zero, () {
      setState(() {
        selectedCity = city;
      });
    });
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather(selectedCity);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Weather App',
        ),
        centerTitle: true,

        // NavBar with 4 buttons
        // NavBar Start
        //
      ),
      drawer: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return DrawerWidget(selectedCity: selectedCity, data: data);
        },
      ),
      //
      //NavBar End
      body: Container(
        decoration: BoxDecoration(
          //
          // Scaffold background colorStart
          //

          // Gradient background
          gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.orange.shade50],
              begin: Alignment.centerLeft,
              end: Alignment.bottomLeft,
              stops: const [0.3, 0.7]),

          // Solid color background
          // color: Colors.orange.shade200,
          //
          // Scaffold background color End
          //
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(0),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(139, 255, 255, 255),
                      Color.fromARGB(0, 255, 255, 255),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                      hintText: 'Search here..',
                      hintStyle: TextStyle(),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        // style when clicked
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  onSubmitted: _searchCity,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: getData(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //
                          // Weather Home layout Start
                          //
                          Container(
                            child: weatherWidget(
                                '${data!.weatherIcon}',
                                '${data!.weatherDesc}',
                                '${data!.temp}',
                                '${data!.cityName}'),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Additional Information",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xdd212121),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 300,
                            child: const Divider(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          homeInfoWidget(
                              '${data!.windSpeed}',
                              '${data!.humidity}',
                              '${data!.pressure}',
                              '${data!.feelsLike}'),
                          //
                          // Weather Home layout End
                          //
                        ],
                      );
                    }
                    return Container();
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
