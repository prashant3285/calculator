import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://github.com/prashant3285/calculator/';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textile Calculator'),
        centerTitle: true,
      ),
      drawer: drawerMenu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '\nThis is an opensource project\nPost Tool/Calculator request on Github Issues',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            InkWell(
              child: Text(
                'https://github.com/prashant3285/calculator',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber),
              ),
              onTap: () {
                _launchURL();
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _button('GSM', '/gsm', context),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _button('Yarn Linear Density', '/yarn', context),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _button('Monofilament Diameter', '/mono', context),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _button('Fabric Cover', '/cover', context),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: _button('Yarn Consumption', '/yconsu', context),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

ElevatedButton _button(String label, String path, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, path);
    },
    style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: TextStyle(
          fontSize: 15,
        )),
    child: Text(
      label,
    ),
  );
}
