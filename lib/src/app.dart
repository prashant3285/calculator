import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/homepage.dart';

import 'screens/gsm.dart';
import 'screens/yarnld.dart';
import 'screens/mono.dart';
import 'screens/cover.dart';
import 'screens/yarnconsumption.dart';
import 'screens/gsmw.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan,
        fontFamily: 'Source Sans Pro',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
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
        '/cover': (context) => Cover(),
        '/yconsu': (context) => YarnCons(),
        '/gsmw': (context) => GsmCalculatorW(),
      },
    );
  }
}
