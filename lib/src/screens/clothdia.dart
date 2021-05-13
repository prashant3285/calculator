import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

class ClothDia extends StatefulWidget {
  ClothDia({Key? key}) : super(key: key);

  @override
  _ClothDiaState createState() => _ClothDiaState();
}

class _ClothDiaState extends State<ClothDia> {
  final _formKey = GlobalKey<FormState>();
  double od = double.nan;

  double fabLength = double.nan;
  double fabThickness = double.nan;
  // String dimension = 'Diameter (mm)';

  // String? newValue = 'Circle';
  double rollDia = double.nan;

  void calculateDia() {
    setState(
      () {
        if (!fabLength.isNaN && !od.isNaN && !fabThickness.isNaN) {
          double turns = (fabThickness -
                  od +
                  (sqrt(pow(od - fabThickness, 2) +
                      (4 * fabThickness * (fabLength * 1000) / 3.14)))) /
              (2 * fabThickness);
          rollDia = 2 * turns * fabThickness + od;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: 'KTOOL - ${global.title7}',
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(global.title7),
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
                  '\n${global.desc7.toUpperCase()}\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat('Fabric Length (m)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            fabLength = double.parse(value);
                          } catch (e) {
                            fabLength = double.nan;
                            rollDia = double.nan;
                          }
                          calculateDia();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat('Fabric Thickness (mm)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            fabThickness = double.parse(value);
                          } catch (e) {
                            fabThickness = double.nan;
                            rollDia = double.nan;
                          }
                          calculateDia();
                        },
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            _inputFormat('Cloth Tube Outer Diameter (mm)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            od = double.parse(value);
                          } catch (e) {
                            od = double.nan;
                            rollDia = double.nan;
                          }
                          calculateDia();
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Cloth Roll Diameter (mm)",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    child: (rollDia.isNaN)
                        ? Text('')
                        : Text(
                            rollDia.toStringAsFixed(2),
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
                    rollDia = double.nan;
                    od = double.nan;

                    fabLength = double.nan;
                    fabThickness = double.nan;

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
