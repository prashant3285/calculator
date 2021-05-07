import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    setState(() {
      if (newValue == 'Nm') {
        warpLD = 9000 / warpCount;
      } else if (newValue == 'tex') {
        warpLD = warpCount * 9;
      } else if (newValue == 'denier') {
        warpLD = warpCount;
      } else {
        warpLD = 5315 / warpCount;
      }

      if (newValue1 == 'Nm') {
        weftLD = 9000 / weftCount;
      } else if (newValue1 == 'tex') {
        weftLD = weftCount * 9;
      } else if (newValue1 == 'denier') {
        weftLD = weftCount;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GSM Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Warp Yarn Size:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
              ),
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Weft Yarn Size:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
              ),
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Ends Per Inch:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
                  ],
                ),
              ),
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Picks Per Inch:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
              ),
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Warp Crimp (%):',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
                  ],
                ),
              ),
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Weft Crimp (%):',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 15,
                          )),
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
                        setState(() {
                          print('Form Reset');
                        });
                      },
                      child: Text('Reset'),
                    ),
                  ],
                ),
              ),
              Container(
                width: formWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: columnWidth,
                      child: Text(
                        'Calculated GSM:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      width: fieldWidth,
                      child: (gsm.isNaN)
                          ? Text('')
                          : Text(
                              gsm.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
