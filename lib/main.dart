import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/bmi_screen.dart';
import 'package:flutter_bootcamp/screens/intro_screen.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,

        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
      },
      initialRoute: '/',
      // home: const IntroScreen(),
    );
  }
}
