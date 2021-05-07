import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class MonoDia extends StatefulWidget {
  MonoDia({Key? key}) : super(key: key);

  @override
  _MonoDiaState createState() => _MonoDiaState();
}

class _MonoDiaState extends State<MonoDia> {
  double fieldWidth = 70;
  double dropDownWidth = 110;
  double denier = double.nan;
  double density = 0.91;
  double diameter = double.nan;
  double inputDenier = double.nan;
  double inputDiameter = double.nan;

  double inputVal = double.nan;
  String? newValue;
  RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

  void calculateDia() {
    setState(() {
      if (newValue != null) {
        if (newValue == 'PA 6') {
          density = 1.14;
        } else if (newValue == 'PA 6,6') {
          density = 1.14;
        } else if (newValue == 'PET') {
          density = 1.38;
        } else if (newValue == 'PA 12') {
          density = 1.02;
        } else if (newValue == 'PA 6,12') {
          density = 1.05;
        } else if (newValue == 'PA 6,11') {
          density = 1.09;
        } else if (newValue == 'LDPE') {
          density = 0.91;
        } else if (newValue == 'HDPE') {
          density = 0.95;
        } else if (newValue == 'p-Aramid') {
          density = 1.44;
        } else if (newValue == 'm-Aramid') {
          density = 1.38;
        } else if (newValue == 'PS') {
          density = 1.06;
        } else if (newValue == 'PMMA') {
          density = 1.19;
        } else if (newValue == 'Carbon') {
          density = 1.81;
        } else if (newValue == 'Carbon HM') {
          density = 1.90;
        } else if (newValue == 'Carbon UHM') {
          density = 2.0;
        } else if (newValue == 'PAN') {
          density = 1.18 / inputVal;
        } else {
          density = 0.91 / inputVal;
        }
      }

      if (!inputDiameter.isNaN) {
        denier = 3.14 *
            pow(inputDiameter / 1000, 2) *
            9000 *
            density *
            pow(10, 6) /
            4;
      }

      if (!inputDenier.isNaN) {
        diameter =
            sqrt((inputDenier / (density * pow(10, 6))) / (9000 * 3.14)) *
                2 *
                1000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monofilament Diameter Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Polymer Density :',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: dropDownWidth,
                            child: DropdownButtonFormField<String>(
                              style: Theme.of(context).textTheme.bodyText1,
                              value: 'PP',
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 20,
                              elevation: 16,
                              items: [
                                'PP',
                                'PA 6',
                                'PA 6,6',
                                'PET',
                                'PA 12',
                                'PA 6,12',
                                'PA 6,11',
                                'LDPE',
                                'HDPE',
                                'p-Aramid',
                                'm-Aramid',
                                'PS',
                                'PMMA',
                                'Carbon',
                                'Carbon HM',
                                'Carbon UHM',
                                'PAN',
                              ]
                                  .map((label) => DropdownMenuItem(
                                        child: Text(label.toString()),
                                        value: label,
                                      ))
                                  .toList(),
                              hint: Text('Rating'),
                              onChanged: (value) {
                                newValue = value;
                                print('onChanged');
                                calculateDia();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: Text(
                              '${density.toStringAsFixed(2)} g/cc',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text(
                                'Denier :',
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: fieldWidth,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.bodyText1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    exp,
                                  )
                                ],
                                onChanged: (value) {
                                  try {
                                    inputDenier = double.parse(value);
                                  } catch (e) {
                                    inputDenier = double.nan;
                                    diameter = double.nan;
                                  }
                                  calculateDia();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Value';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                '>>>    Diameter (mm) : ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Container(
                              child: (diameter.isNaN)
                                  ? Text('')
                                  : Text(
                                      diameter.toStringAsFixed(2),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text(
                                'Diameter (mm) :',
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: fieldWidth,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.bodyText1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    exp,
                                  )
                                ],
                                onChanged: (value) {
                                  try {
                                    inputDiameter = double.parse(value);
                                  } catch (e) {
                                    inputDiameter = double.nan;
                                    denier = double.nan;
                                  }
                                  calculateDia();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Value';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                '>>>    Denier : ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Container(
                              child: (denier.isNaN)
                                  ? Text('')
                                  : Text(
                                      denier.toStringAsFixed(2),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
