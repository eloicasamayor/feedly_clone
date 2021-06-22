import 'package:flutter/material.dart';
import 'screens/bottom_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> colorPrincipal = {
    50: Color.fromRGBO(43, 178, 76, .1),
    100: Color.fromRGBO(43, 178, 76, .2),
    200: Color.fromRGBO(43, 178, 76, .3),
    300: Color.fromRGBO(43, 178, 76, .4),
    400: Color.fromRGBO(43, 178, 76, .5),
    500: Color.fromRGBO(43, 178, 76, .6),
    600: Color.fromRGBO(43, 178, 76, .7),
    700: Color.fromRGBO(43, 178, 76, .8),
    800: Color.fromRGBO(43, 178, 76, .9),
    900: Color.fromRGBO(43, 178, 76, .1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedly Clone',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF2bb24c, colorPrincipal),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
        primaryColorBrightness: Brightness.light,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: MyHomePage(title: 'Today'),
    );
  }
}
