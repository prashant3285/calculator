import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                  'TOOLS\n\n1) GSM - calculate fabric GSM based on yarn property and fanbric construction\n2) Yarn Count - Convert yarn linear density into different formats\n3) Warping - Calculate the yarn requirement for warping\n\nUse menu button on top left to navigate'),
            ),
          ],
        ),
      ),
    );
  }
}
