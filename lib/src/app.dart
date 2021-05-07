import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'screens/gsmcalculator.dart';
import 'screens/yarnld.dart';
import 'screens/monodia.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0),
          bodyText1: TextStyle(fontSize: 15.0),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/gsm': (context) => GsmCalculator(),
        '/yarn': (context) => YarnLD(),
        '/mono': (context) => MonoDia(),
      },
    );
  }
}
