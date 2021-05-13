import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

class MonoDia extends StatefulWidget {
  MonoDia({Key? key}) : super(key: key);

  @override
  _MonoDiaState createState() => _MonoDiaState();
}

class _MonoDiaState extends State<MonoDia> {
  double denier = double.nan;
  double density = 0.91;
  double diameter = double.nan;
  double inputDenier = double.nan;
  double inputDiameter = double.nan;

  double inputVal = double.nan;
  String? newValue;
  RegExp exp = RegExp(r"[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)");

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
          density = 1.18;
        } else {
          density = 0.91;
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
        title: Text(global.title3),
        centerTitle: true,
      ),
      drawer: drawerMenu(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '\n${global.desc3.toUpperCase()}\n',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  isDense: false,
                  labelText: 'Select Polymer',
                  helperText: 'Choose polymer for appropriate density',
                  filled: true,
                  icon: FaIcon(
                    FontAwesomeIcons.vial,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                value: 'PP',
                icon: const Icon(Icons.arrow_downward),
                iconSize: 20,
                elevation: 16,
                items: polymers
                    .map((label) => DropdownMenuItem(
                          child: Text(label.toString()),
                          value: label,
                        ))
                    .toList(),
                hint: Text('Rating'),
                onChanged: (value) {
                  newValue = value;
                  calculateDia();
                },
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Polymer Density : '),
                    Text(
                      '${density.toStringAsFixed(2)} g/cc',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Diameter (mm)",
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                  Flexible(
                    child: Container(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Denier",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        child: (denier.isNaN)
                            ? Text('')
                            : Text(
                                denier.toStringAsFixed(0),
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Denier",
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.number,
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FaIcon(FontAwesomeIcons.arrowRight),
                  ),
                  Flexible(
                    child: Container(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Diameter (mm)",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        child: (diameter.isNaN)
                            ? Text('')
                            : Text(
                                diameter.toStringAsFixed(2),
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> polymers = [
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
];
