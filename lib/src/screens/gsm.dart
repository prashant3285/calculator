import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

class GsmCalculator extends StatefulWidget {
  GsmCalculator({Key? key}) : super(key: key);

  @override
  _GsmCalculatorState createState() => _GsmCalculatorState();
}

class _GsmCalculatorState extends State<GsmCalculator> {
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
        title: Text(global.title1),
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
                  '\n${global.desc1.toUpperCase()}\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat('Warp Yarn Count'),
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
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat("Weft Yarn Count"),
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
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat("Ends Per Inch"),
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat("Picks Per Inch"),
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
                        decoration: _inputFormat("Warp Crimp (%)"),
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat("Weft Crimp (%)"),
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
                      ),
                    ),
                  ],
                ),
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
