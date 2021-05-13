import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

class YarnContent extends StatefulWidget {
  YarnContent({Key? key}) : super(key: key);

  @override
  _YarnContentState createState() => _YarnContentState();
}

class _YarnContentState extends State<YarnContent> {
  final _formKey = GlobalKey<FormState>();
  double pkgOd = double.nan;
  double pkgTubeOd = double.nan;
  double pkgTraverse = double.nan;
  double pkgDensity = double.nan;
  double yarnCount = double.nan;
  double pkgWeight = double.nan;
  double pkgLength = double.nan;

  void calculateDia() {
    setState(
      () {
        if (!pkgDensity.isNaN &&
            !pkgOd.isNaN &&
            !pkgTraverse.isNaN &&
            !pkgTubeOd.isNaN) {
          pkgWeight = ((3.14 *
                      (pow((pkgOd / 2 / 10), 2) -
                          pow((pkgTubeOd / 2 / 10), 2)) *
                      (pkgTraverse / 10)) *
                  (pkgDensity / 100)) /
              1000;
        }
        if (!pkgDensity.isNaN &&
            !pkgOd.isNaN &&
            !pkgTraverse.isNaN &&
            !pkgTubeOd.isNaN &&
            !yarnCount.isNaN) {
          pkgLength = ((3.14 *
                      (pow((pkgOd / 2 / 10), 2) -
                          pow((pkgTubeOd / 2 / 10), 2)) *
                      (pkgTraverse / 10)) *
                  (pkgDensity / 100)) *
              9000 /
              (5315 / yarnCount);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: 'KTOOL - ${global.title8}',
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(global.title8),
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
                  '\n${global.desc8.toUpperCase()}\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: _inputFormat('Package OD (mm)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            pkgOd = double.parse(value);
                          } catch (e) {
                            pkgOd = double.nan;
                            pkgWeight = double.nan;
                            pkgLength = double.nan;
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
                        decoration: _inputFormat('Package Tube OD (mm)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            pkgTubeOd = double.parse(value);
                          } catch (e) {
                            pkgTubeOd = double.nan;
                            pkgWeight = double.nan;
                            pkgLength = double.nan;
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
                        decoration: _inputFormat('Package Traverse (mm)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            pkgTraverse = double.parse(value);
                          } catch (e) {
                            pkgTraverse = double.nan;
                            pkgWeight = double.nan;
                            pkgLength = double.nan;
                          }
                          calculateDia();
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
                        decoration: _inputFormat('Package Desnity (%)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            pkgDensity = double.parse(value);
                          } catch (e) {
                            pkgDensity = double.nan;
                            pkgWeight = double.nan;
                            pkgLength = double.nan;
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
                        decoration: _inputFormat('Yarn Count (Ne)'),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            exp,
                          )
                        ],
                        onChanged: (value) {
                          try {
                            yarnCount = double.parse(value);
                          } catch (e) {
                            yarnCount = double.nan;
                            pkgWeight = double.nan;
                            pkgLength = double.nan;
                          }
                          calculateDia();
                        },
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Package Weight (kg)",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          child: (pkgWeight.isNaN)
                              ? Text('')
                              : Text(
                                  pkgWeight.toStringAsFixed(2),
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
                            labelText: "Package Lenght (m)",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          child: (pkgLength.isNaN)
                              ? Text('')
                              : Text(
                                  pkgLength.toStringAsFixed(2),
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
                    pkgWeight = double.nan;
                    pkgLength = double.nan;
                    pkgOd = double.nan;
                    pkgTraverse = double.nan;
                    pkgTubeOd = double.nan;
                    pkgDensity = double.nan;
                    yarnCount = double.nan;
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
