import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> forecast = {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100"
  };

  Map<String, String> location = {
    "city": "Bend",
    "state": "Oregon",
    "zip": "97702"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 115, 162, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCustomContainer(
                children: [
                  _buildText('Location',
                      fontWeight: FontWeight.bold, fontSize: 20),
                  const SizedBox(height: 10),
                  _buildText('City: ${location["city"]}', fontSize: 18),
                  _buildText('State: ${location["state"]}', fontSize: 18),
                  _buildText('Zip: ${location["zip"]}', fontSize: 18),
                ],
              ),
              const SizedBox(height: 16),
              _buildCustomContainer(
                children: [
                  _buildText('Current Weather Forecast',
                      fontWeight: FontWeight.bold, fontSize: 20),
                  const SizedBox(height: 16),
                  _buildText('Temperature: ${forecast["temperature"]}°F',
                      fontSize: 18),
                  _buildText(
                      'Detailed Forecast: ${forecast["detailedForecast"]}',
                      fontSize: 18),
                  _buildText(
                      'Wind Speed/Direction: ${forecast["windSpeed"]} mph ${forecast["windDirection"]}',
                      fontSize: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomContainer({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildText(String text, {FontWeight? fontWeight, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Colors.black,
      ),
    );
  }
}
