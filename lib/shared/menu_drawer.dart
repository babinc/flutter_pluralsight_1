import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/sessions_screen.dart';
import 'package:flutter_bootcamp/screens/weather_screen.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  static const HOME = 'Home';
  static const BMI_CALCULATOR = 'BMI Calculator';
  static const WEATHER = 'Weather';
  static const TRAINING = 'Training';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      HOME,
      BMI_CALCULATOR,
      WEATHER,
      TRAINING
    ];

    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28))));

    menuTitles.forEach((element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element, style: const TextStyle(fontSize: 18)),
        onTap: () {
          switch (element) {
            case HOME:
              screen = const IntroScreen();
              break;
            case BMI_CALCULATOR:
              screen = const BmiScreen();
              break;
            case WEATHER:
              screen = const WeatherScreen();
              break;
            case TRAINING:
              screen = const SessionsScreen();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );
        },
      ));
    });

    return menuItems;
  }
}
