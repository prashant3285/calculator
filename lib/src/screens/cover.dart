import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer.dart';
import '../global/var.dart' as global;

RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

class Cover extends StatefulWidget {
  Cover({Key? key}) : super(key: key);

  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> {
  final _formKey = GlobalKey<FormState>();
  double warpCount = double.nan;
  double weftCount = double.nan;
  double epi = double.nan;
  double ppi = double.nan;

  double weaveFactor = 1;
  String? newValue;
  double cover = double.nan;

  void calculateCover() {
    setState(
      () {
        if (newValue == 'Twill 1/2') {
          weaveFactor = 0.87;
        } else if (newValue == 'Twill 1/3') {
          weaveFactor = 0.77;
        } else if (newValue == 'Basket 2/2') {
          weaveFactor = 0.82;
        } else if (newValue == 'Satin 1/4') {
          weaveFactor = 0.69;
        } else {
          weaveFactor = 1;
        }

        if (!epi.isNaN &&
            !ppi.isNaN &&
            !warpCount.isNaN &&
            !weftCount.isNaN &&
            !weaveFactor.isNaN) {
          cover = weaveFactor *
              ((epi / sqrt(warpCount) + ppi / sqrt(weftCount)) -
                  ((epi / sqrt(warpCount) * ppi / sqrt(weftCount)) / 28));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(global.title4),
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
                  '\n${global.desc4.toUpperCase()}\n',
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
                            cover = double.nan;
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
                            cover = double.nan;
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
                            cover = double.nan;
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
                            cover = double.nan;
                          }
                          calculateCover();
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
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'Fabric Weave',
                          // helperText: 'Choose polymer for appropriate density',
                          filled: true,
                        ),
                        value: 'Plain 1/1',
                        icon: const Icon(Icons.arrow_downward),
                        items: weaves
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
                          calculateCover();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    _ResultDisplay('Weave Factor', weaveFactor),
                  ],
                ),
                Divider(),
                Container(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Fabric Cover Factor',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    child: (cover.isNaN)
                        ? Text('')
                        : Text(
                            cover.toStringAsFixed(2),
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
                    cover = double.nan;
                    warpCount = double.nan;
                    weftCount = double.nan;
                    weaveFactor = 1;
                    epi = double.nan;
                    ppi = double.nan;
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

List<String> weaves = [
  'Plain 1/1',
  'Twill 1/2',
  'Twill 1/3',
  'Basket 2/2',
  'Satin 1/4',
];
