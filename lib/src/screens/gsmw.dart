import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

class GsmCalculatorW extends StatefulWidget {
  GsmCalculatorW({Key? key}) : super(key: key);

  @override
  _GsmCalculatorWState createState() => _GsmCalculatorWState();
}

class _GsmCalculatorWState extends State<GsmCalculatorW> {
  final _formKey = GlobalKey<FormState>();
  double weight = double.nan;

  double dia = double.nan;
  double width = double.nan;
  String dimension = 'Diameter (mm)';

  String? newValue = 'Circle';
  double gsm = double.nan;

  void calculateGSM() {
    setState(
      () {
        if (newValue == 'Circle') {
          if (!dia.isNaN && !weight.isNaN) {
            gsm = weight / (pi * pow((dia / 2 / 1000), 2));
          }
        }

        if (newValue == 'Square') {
          if (!dia.isNaN && !weight.isNaN) {
            gsm = weight / ((dia / 1000) * (dia / 1000));
          }
        }

        if (newValue == 'Rectangle') {
          if (!dia.isNaN && !weight.isNaN && !width.isNaN) {
            gsm = weight / ((dia / 1000) * (width / 1000));
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(global.title6),
        centerTitle: true,
      ),
      drawer: drawerMenu(context),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '\n${global.desc6.toUpperCase()}\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat('Weight (g)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            weight = double.parse(value);
                          } catch (e) {
                            weight = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'Fabric Shape',
                          // helperText: 'Choose polymer for appropriate density',
                          filled: true,
                        ),
                        value: 'Circle',
                        icon: const Icon(Icons.arrow_downward),
                        items: ['Circle', 'Square', 'Rectangle']
                            .map((label) => DropdownMenuItem(
                                  child: Text(
                                    label.toString(),
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        onChanged: (value) {
                          newValue = value;
                          if (value != 'Circle') {
                            dimension = 'Length (mm)';
                          } else {
                            dimension = 'Diameter (mm)';
                          }

                          calculateGSM();
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat(dimension),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            dia = double.parse(value);
                          } catch (e) {
                            dia = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    (newValue == 'Rectangle')
                        ? Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: _inputFormat('Width (mm)'),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  exp,
                                )
                              ],
                              onChanged: (value) {
                                try {
                                  width = double.parse(value);
                                } catch (e) {
                                  width = double.nan;
                                  gsm = double.nan;
                                }
                                calculateGSM();
                              },
                            ),
                          )
                        : Flexible(
                            child: Text(''),
                          ),
                  ],
                ),
                Divider(),
                Divider(),
                Divider(),
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Calculated GSM ",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    child: (gsm.isNaN)
                        ? Text('')
                        : Text(
                            gsm.toStringAsFixed(2),
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                  ),
                ),
                Divider(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    gsm = double.nan;
                    weight = double.nan;

                    dia = double.nan;
                    width = double.nan;
                    dimension = 'Diameter (mm)';
                    newValue = "Circle";

                    _formKey.currentState!.reset();
                    setState(
                      () {
                        print('Form Reset');
                      },
                    );
                  },
                  child: FaIcon(FontAwesomeIcons.redo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputFormat(String labelTextStr) {
  return InputDecoration(
    contentPadding: EdgeInsets.all(12),
    labelText: labelTextStr,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(),
    ),
  );
}
