import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YarnLD extends StatefulWidget {
  YarnLD({Key? key}) : super(key: key);

  @override
  _YarnLDState createState() => _YarnLDState();
}

class _YarnLDState extends State<YarnLD> {
  double fieldWidth = 80;
  double dropDownWidth = 120;
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
        } else if (newValue == 'WAG') {
          denier = inputVal * 31.89;
        } else if (newValue == 'WCB') {
          denier = inputVal * 83.04;
        } else if (newValue == 'WSB') {
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
        } else if (newValue == 'WYS') {
          denier = 17439.8 / inputVal;
        } else if (newValue == 'WWE') {
          denier = 13951.9 / inputVal;
        } else if (newValue == 'WD') {
          denier = 279037.5 / inputVal;
        } else if (newValue == 'WG') {
          denier = 22323 / inputVal;
        } else if (newValue == 'WH') {
          denier = 24185.3 / inputVal;
        } else if (newValue == 'WAR') {
          denier = 2790.4 / inputVal;
        } else if (newValue == 'WAC') {
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
        title: Text('Yarn Linear Density Converter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Yarn Linear Density:',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: fieldWidth,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1,
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
                              style: Theme.of(context).textTheme.bodyText1,
                              value: 'Ne',
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 20,
                              elevation: 16,
                              items: [
                                'Ne',
                                'Nm',
                                'Tex',
                                'Denier',
                                'Dtex',
                                'WAG',
                                'WCB',
                                'WSB',
                                'Dram Silk',
                                'Denier Silk',
                                'Jute Dandee',
                                'Linen',
                                'French Cotton',
                                'Raw Silk',
                                'Spun Silk',
                                'Worsted',
                                'WYS',
                                'WWE',
                                'WD',
                                'WG',
                                'WH',
                                'WAR',
                                'WAC'
                              ]
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Denier :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (denier.isNaN)
                                          ? Text('')
                                          : Text(
                                              denier.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Tex :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (tex.isNaN)
                                          ? Text('')
                                          : Text(
                                              tex.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Nm :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (nm.isNaN)
                                          ? Text('')
                                          : Text(
                                              nm.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Ne :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (ne.isNaN)
                                          ? Text('')
                                          : Text(
                                              ne.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Dtex :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (dtex.isNaN)
                                          ? Text('')
                                          : Text(
                                              dtex.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Dram Silk :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (dramSilk.isNaN)
                                          ? Text('')
                                          : Text(
                                              dramSilk.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Denier Silk :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (denierSilk.isNaN)
                                          ? Text('')
                                          : Text(
                                              denierSilk.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Jute Dandee :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (juteDandee.isNaN)
                                          ? Text('')
                                          : Text(
                                              juteDandee.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Linen :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (linen.isNaN)
                                          ? Text('')
                                          : Text(
                                              linen.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'French Cotton :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (frenchCotton.isNaN)
                                          ? Text('')
                                          : Text(
                                              frenchCotton.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Raw Silk :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (rawSilk.isNaN)
                                          ? Text('')
                                          : Text(
                                              rawSilk.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Spun Silk :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (spunSilk.isNaN)
                                          ? Text('')
                                          : Text(
                                              spunSilk.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Worsted :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (worsted.isNaN)
                                          ? Text('')
                                          : Text(
                                              worsted.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen American Grain (WAG) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wag.isNaN)
                                          ? Text('')
                                          : Text(
                                              wag.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen Cumberland Bunch (WCB) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wcb.isNaN)
                                          ? Text('')
                                          : Text(
                                              wcb.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen Sowerby Bridge (WSB) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wsb.isNaN)
                                          ? Text('')
                                          : Text(
                                              wsb.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen Yorkshire Skein (WYS) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wys.isNaN)
                                          ? Text('')
                                          : Text(
                                              wys.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen West of England (WWE) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wwe.isNaN)
                                          ? Text('')
                                          : Text(
                                              wwe.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen Dewsburry (WD) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wd.isNaN)
                                          ? Text('')
                                          : Text(
                                              wd.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen Galashiels (WG) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wg.isNaN)
                                          ? Text('')
                                          : Text(
                                              wg.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen Hawick (WH) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wh.isNaN)
                                          ? Text('')
                                          : Text(
                                              wh.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen American Run (WAR) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (war.isNaN)
                                          ? Text('')
                                          : Text(
                                              war.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Woollen American Cut (WAC) :',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: (wac.isNaN)
                                          ? Text('')
                                          : Text(
                                              wac.toStringAsFixed(2),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
