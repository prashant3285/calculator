import 'package:flutter/material.dart';

class GsmCalculator extends StatefulWidget {
  GsmCalculator({Key key}) : super(key: key);

  @override
  _GsmCalculatorState createState() => _GsmCalculatorState();
}

class _GsmCalculatorState extends State<GsmCalculator> {
  double columnWidth = 150;
  double fieldWidth = 100;
  double dropDownWidth = 80;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GSM Calculator'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Warp Yarn Size:'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: dropDownWidth,
                      child: DropdownButtonFormField<String>(
                        value: 'Ne',
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        items: ['Ne', 'Nm', 'tex', 'denier']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString()),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Rating'),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Weft Yarn Size:'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: dropDownWidth,
                      child: DropdownButtonFormField<String>(
                        value: 'Ne',
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        items: ['Ne', 'Nm', 'tex', 'denier']
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString()),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Rating'),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Ends Per Inch:'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Picks Per Inch:'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Warp Crimp (%):'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Weft Crimp (%):'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text('Calculate'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState.reset();
                        },
                        child: Text('Reset'),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text('Calculated GSM:'),
                    ),
                    Container(
                      width: fieldWidth,
                      child: Text('result'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
