import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

class YarnCons extends StatefulWidget {
  YarnCons({Key? key}) : super(key: key);

  @override
  _YarnConsState createState() => _YarnConsState();
}

class _YarnConsState extends State<YarnCons> {
  final _formKey = GlobalKey<FormState>();
  double warpCount = double.nan;
  double weftCount = double.nan;
  double reedSpace = double.nan;
  double fringe = double.nan;
  double epi = double.nan;
  double ppi = double.nan;
  double warpCrimp = double.nan;
  double weftCrimp = double.nan;
  double fabricLen = double.nan;
  double wastage = double.nan;
  double weftCon = double.nan;
  double warpCon = double.nan;

  void calculateCover() {
    setState(
      () {
        if (!ppi.isNaN &&
            !wastage.isNaN &&
            !reedSpace.isNaN &&
            !fringe.isNaN &&
            !fabricLen.isNaN) {
          weftCon = (((reedSpace + fringe) * 2.54) / 100) *
              (ppi * 100 / 2.54) *
              fabricLen *
              (5313 / weftCount) *
              (1 + wastage / 100) /
              (9000 * 1000);
        }

        if (!epi.isNaN &&
            !wastage.isNaN &&
            !warpCount.isNaN &&
            !warpCrimp.isNaN &&
            !fabricLen.isNaN) {
          warpCon = reedSpace *
              epi *
              fabricLen *
              (1 + warpCrimp / 100) *
              (5315 / warpCount) *
              (1 + wastage / 100) /
              (9000 * 1000);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(global.title5),
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
                  '\n${global.desc5.toUpperCase()}\n',
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
                        decoration: _inputFormat('Warp Yarn Count (Ne)'),
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
                            warpCon = double.nan;
                          }
                          calculateCover();
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
                        decoration: _inputFormat("Weft Yarn Count (Ne)"),
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
                            weftCon = double.nan;
                          }
                          calculateCover();
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
                        decoration: _inputFormat("On-Loom EPI"),
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
                            warpCon = double.nan;
                          }
                          calculateCover();
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
                            weftCon = double.nan;
                          }
                          calculateCover();
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
                            warpCon = double.nan;
                          }
                          calculateCover();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: TextFormField(
                        enabled: false,
                        style: Theme.of(context).textTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat("Weft Crimp :-)"),
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
                          }
                          calculateCover();
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
                        decoration: _inputFormat("Reed Space (inch)"),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            reedSpace = double.parse(value);
                          } catch (e) {
                            reedSpace = double.nan;
                            weftCon = double.nan;
                          }
                          calculateCover();
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
                        decoration: _inputFormat("Weft Fringe (inch)"),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            fringe = double.parse(value);
                          } catch (e) {
                            fringe = double.nan;
                            weftCon = double.nan;
                          }
                          calculateCover();
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
                        decoration: _inputFormat("Fabric Length (m)"),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            fabricLen = double.parse(value);
                          } catch (e) {
                            fabricLen = double.nan;
                            warpCon = double.nan;
                            weftCon = double.nan;
                          }
                          calculateCover();
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
                        decoration: _inputFormat("Wastage (%)"),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            wastage = double.parse(value);
                          } catch (e) {
                            wastage = double.nan;
                            weftCon = double.nan;
                            warpCon = double.nan;
                          }
                          calculateCover();
                        },
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Warp Consumption (kg)',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          child: (warpCon.isNaN)
                              ? Text('')
                              : Text(
                                  warpCon.toStringAsFixed(2),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(
                      child: Container(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Weft Consumption (kg)',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          child: (weftCon.isNaN)
                              ? Text('')
                              : Text(
                                  weftCon.toStringAsFixed(2),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    weftCon = double.nan;
                    warpCon = double.nan;
                    warpCount = double.nan;
                    weftCount = double.nan;
                    warpCrimp = double.nan;
                    weftCrimp = double.nan;
                    epi = double.nan;
                    ppi = double.nan;
                    wastage = double.nan;
                    fringe = double.nan;
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

class _ResultDisplay extends StatelessWidget {
  late final String label;
  late final double result;

  _ResultDisplay(this.label, this.result);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          child: (result.isNaN)
              ? Text('')
              : Text(
                  result.toStringAsFixed(2),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
        ),
      ),
    );
  }
}
