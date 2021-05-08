import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';

class GsmCalculator extends StatefulWidget {
  GsmCalculator({Key? key}) : super(key: key);

  @override
  _GsmCalculatorState createState() => _GsmCalculatorState();
}

class _GsmCalculatorState extends State<GsmCalculator> {
  double columnWidth = 130;
  double fieldWidth = 70;
  double dropDownWidth = 80;
  double formWidth = 350;
  final _formKey = GlobalKey<FormState>();
  double warpCount = double.nan;
  double weftCount = double.nan;
  double warpLD = double.nan;
  double weftLD = double.nan;
  double epi = double.nan;
  double ppi = double.nan;
  double warpCrimp = double.nan;
  double weftCrimp = double.nan;
  String? newValue;
  String? newValue1;
  double gsm = double.nan;
  RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

  void calculateGSM() {
    setState(
      () {
        if (newValue == 'Nm') {
          warpLD = 9000 / warpCount;
        } else if (newValue == 'Tex') {
          warpLD = warpCount * 9;
        } else if (newValue == 'Denier') {
          warpLD = warpCount;
        } else if (newValue == 'Dtex') {
          warpLD = warpCount * 0.9;
        } else {
          warpLD = 5315 / warpCount;
        }

        if (newValue1 == 'Nm') {
          weftLD = 9000 / weftCount;
        } else if (newValue1 == 'Tex') {
          weftLD = weftCount * 9;
        } else if (newValue1 == 'Denier') {
          weftLD = weftCount;
        } else if (newValue1 == 'Dtex') {
          weftLD = weftCount * 0.9;
        } else {
          weftLD = 5315 / weftCount;
        }
        if (!epi.isNaN &&
            !ppi.isNaN &&
            !warpCount.isNaN &&
            !weftCount.isNaN &&
            !warpLD.isNaN &&
            !weftLD.isNaN) {
          gsm = ((epi * (1 + (warpCrimp / 100))) * warpLD / 354330.7 +
                  (ppi * (1 + (weftCrimp / 100))) * weftLD / 354330.7) /
              0.000645;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GSM'),
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
                  '\nWOVEN FABRIC GSM CALCULATION\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Warp Yarn Count",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            warpCount = double.parse(value);
                          } catch (e) {
                            warpCount = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
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
                          labelText: 'Unit',
                          // helperText: 'Choose polymer for appropriate density',
                          filled: true,
                        ),
                        value: 'Ne',
                        icon: const Icon(Icons.arrow_downward),
                        items: ['Ne', 'Nm', 'Tex', 'Denier', 'Dtex']
                            .map((label) => DropdownMenuItem(
                                  child: Text(
                                    label.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Rating'),
                        onChanged: (value) {
                          newValue = value;
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
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Weft Yarn Count",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            weftCount = double.parse(value);
                          } catch (e) {
                            weftCount = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
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
                          labelText: 'Unit',
                          // helperText: 'Choose polymer for appropriate density',
                          filled: true,
                        ),
                        value: 'Ne',
                        icon: const Icon(Icons.arrow_downward),
                        items: ['Ne', 'Nm', 'Tex', 'Denier', 'Dtex']
                            .map((label) => DropdownMenuItem(
                                  child: Text(
                                    label.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Rating'),
                        onChanged: (value) {
                          newValue1 = value;
                          calculateGSM();
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Ends Per Inch",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            epi = double.parse(value);
                          } catch (e) {
                            epi = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Picks Per Inch",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            ppi = double.parse(value);
                          } catch (e) {
                            ppi = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
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
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Warp Crimp (%)",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            warpCrimp = double.parse(value);
                          } catch (e) {
                            warpCrimp = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Weft Crimp (%)",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            weftCrimp = double.parse(value);
                          } catch (e) {
                            weftCrimp = double.nan;
                            gsm = double.nan;
                          }
                          calculateGSM();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Value';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Calculated GSM ",
                      fillColor: Colors.white,
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
                    warpCount = double.nan;
                    weftCount = double.nan;
                    warpLD = double.nan;
                    weftLD = double.nan;
                    epi = double.nan;
                    ppi = double.nan;
                    warpCrimp = double.nan;
                    weftCrimp = double.nan;
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