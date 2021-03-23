import 'package:flutter/material.dart';

class GsmCalculator extends StatefulWidget {
  GsmCalculator({Key key}) : super(key: key);

  @override
  _GsmCalculatorState createState() => _GsmCalculatorState();
}

class _GsmCalculatorState extends State<GsmCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GSM Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary)),
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Warp Yarn Count',
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              child: TextField(),
            ),
            Container(
              width: 100,
              child: TextField(),
            ),
            Container(
              width: 100,
              child: TextField(),
            ),
            Container(
              width: 100,
              child: TextField(),
            ),
          ],
        ),
      ),
    );
  }
}
