import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
          ],
        ),
      ),
    );
  }
}

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
