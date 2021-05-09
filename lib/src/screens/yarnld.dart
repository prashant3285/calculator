import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';

class YarnLD extends StatefulWidget {
  YarnLD({Key? key}) : super(key: key);

  @override
  _YarnLDState createState() => _YarnLDState();
}

class _YarnLDState extends State<YarnLD> {
  double denier = double.nan;
  double tex = double.nan;
  double ne = double.nan;
  double nm = double.nan;
  double dtex = double.nan;
  double wag = double.nan;
  double wcb = double.nan;
  double wsb = double.nan;
  double dramSilk = double.nan;
  double denierSilk = double.nan;
  double juteDandee = double.nan;
  double linen = double.nan;
  double frenchCotton = double.nan;
  double rawSilk = double.nan;
  double spunSilk = double.nan;
  double worsted = double.nan;
  double wys = double.nan;
  double wwe = double.nan;
  double wd = double.nan;
  double wg = double.nan;
  double wh = double.nan;
  double war = double.nan;
  double wac = double.nan;

  double inputVal = double.nan;
  String? newValue;
  RegExp exp = RegExp(r'[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)');

  void calculateLD() {
    setState(() {
      if (!inputVal.isNaN) {
        if (newValue == 'Nm') {
          denier = 9000 / inputVal;
        } else if (newValue == 'Tex') {
          denier = inputVal * 9;
        } else if (newValue == 'Dtex') {
          denier = inputVal * .9;
        } else if (newValue == 'Denier') {
          denier = inputVal;
        } else if (newValue == 'Woollen American Grain') {
          denier = inputVal * 31.89;
        } else if (newValue == 'Woollen Cumberland Bunch') {
          denier = inputVal * 83.04;
        } else if (newValue == 'Woollen Sowerby Bridge') {
          denier = inputVal * 217.99;
        } else if (newValue == 'Dram Silk') {
          denier = inputVal * 17.4;
        } else if (newValue == 'Denier Silk') {
          denier = inputVal * 1;
        } else if (newValue == 'Jute Dandee') {
          denier = inputVal * 310.04;
        } else if (newValue == 'Linen') {
          denier = 14882.0 / inputVal;
        } else if (newValue == 'French Cotton') {
          denier = 4005.2 / inputVal;
        } else if (newValue == 'Raw Silk') {
          denier = 279037.5 / inputVal;
        } else if (newValue == 'Spun Silk') {
          denier = 5315 / inputVal;
        } else if (newValue == 'Worsted') {
          denier = 7972.5 / inputVal;
        } else if (newValue == 'Woollen Yorkshire Skein') {
          denier = 17439.8 / inputVal;
        } else if (newValue == 'Woollen West of England') {
          denier = 13951.9 / inputVal;
        } else if (newValue == 'Woollen Dewsburry') {
          denier = 279037.5 / inputVal;
        } else if (newValue == 'Woollen Galashiels') {
          denier = 22323 / inputVal;
        } else if (newValue == 'Woollen Hawick') {
          denier = 24185.3 / inputVal;
        } else if (newValue == 'Woollen American Run') {
          denier = 2790.4 / inputVal;
        } else if (newValue == 'Woollen American Cut') {
          denier = 14882 / inputVal;
        } else {
          denier = 5315 / inputVal;
        }

        nm = 9000 / denier;
        ne = 5315 / denier;
        tex = denier / 9;
        dtex = denier / 0.9;
        wag = denier / 31.89;
        wcb = denier / 83.04;
        wsb = denier / 217.99;
        dramSilk = denier / 17.4;
        denierSilk = denier;
        juteDandee = denier / 310.04;
        linen = 14882.0 / denier;
        frenchCotton = 4005.2 / denier;
        rawSilk = 279037.5 / denier;
        spunSilk = 5315 / denier;
        worsted = 7972.5 / denier;
        wys = 17439.8 / denier;
        wwe = 13951.9 / denier;
        wg = 22323 / denier;
        wd = 279037.5 / denier;
        wh = 24185.3 / denier;
        war = 2790.4 / denier;
        wac = 14882 / denier;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yarn Count'),
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
                '\nYARN LINEAR DENSITY CONVERSION\n',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Yarn Count",
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
                          inputVal = double.parse(value);
                        } catch (e) {
                          inputVal = double.nan;
                          denier = double.nan;
                          ne = double.nan;
                          nm = double.nan;
                          tex = double.nan;
                          dtex = double.nan;
                          wag = double.nan;
                          wcb = double.nan;
                          wsb = double.nan;
                          dramSilk = double.nan;
                          denierSilk = double.nan;
                          juteDandee = double.nan;
                          linen = double.nan;
                          frenchCotton = double.nan;
                          rawSilk = double.nan;
                          spunSilk = double.nan;
                          worsted = double.nan;
                          wys = double.nan;
                          wwe = double.nan;
                          wd = double.nan;
                          wg = double.nan;
                          wh = double.nan;
                          war = double.nan;
                          wac = double.nan;
                        }
                        calculateLD();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Flexible(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        isDense: false,
                        labelText: 'Unit',
                        filled: true,
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      value: 'Ne',
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 20,
                      elevation: 16,
                      items: _units
                          .map((label) => DropdownMenuItem(
                                child: Text(label.toString()),
                                value: label,
                              ))
                          .toList(),
                      hint: Text('Rating'),
                      onChanged: (value) {
                        newValue = value;
                        calculateLD();
                      },
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Ne', ne),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Nm", nm),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay('French Cotton', frenchCotton)
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Denier', denier),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Dtex", dtex),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay('Tex', tex)
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Dram Silk', dramSilk),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Denier Silk", denierSilk),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay('Raw Silk', rawSilk)
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Spun Silk', spunSilk),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Worsted", worsted),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay('Linen', linen)
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Woollen Sowerby Bridge', wsb),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Woollen Cumberland Bunch", wcb),
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Woollen American Grain', wag),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Woollen Yorkshire Skein", wys),
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Woollen West of England', wwe),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Woollen Dewsburry", wd),
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Woollen American Run', war),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Woollen American Cut", wac),
                ],
              ),
              Divider(),
              Row(
                children: [
                  _ResultDisplay('Woollen Galashiels', wg),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  _ResultDisplay("Woollen Hawick", wh),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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

List<String> _units = [
  'Ne',
  'Nm',
  'Tex',
  'Denier',
  'Dtex',
  'Woollen American Grain',
  'Woollen Cumberland Bunch',
  'Woollen Sowerby Bridge',
  'Dram Silk',
  'Denier Silk',
  'Jute Dandee',
  'Linen',
  'French Cotton',
  'Raw Silk',
  'Spun Silk',
  'Worsted',
  'Woollen Yorkshire Skein',
  'Woollen West of England',
  'Woollen Dewsburry',
  'Woollen Galashiels',
  'Woollen Hawick',
  'Woollen American Run',
  'Woollen American Cut'
];
