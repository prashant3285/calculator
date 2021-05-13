import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../global/var.dart' as global;
import '../global/custom_icons.dart';

const _url = 'https://github.com/prashant3285/calculator/';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textile Calculator'),
        centerTitle: true,
      ),
      drawer: drawerMenu(context),
      body: Column(
        children: [
          Text(
            '\nThis is an opensource project\nPost Tool/Calculator request on Github Issues',
            textAlign: TextAlign.center,
          ),
          InkWell(
            child: Text(
              'https://github.com/prashant3285/calculator',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.amber[200]),
            ),
            onTap: () {
              _launchURL();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tools.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(
                    '${tools[index]}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  leading: toolIcon[index],
                  subtitle: Text(
                    '${toolTips[index]}',
                    style: (TextStyle(
                      fontSize: 12,
                    )),
                  ),
                  focusColor: Colors.amber,
                  onTap: () {
                    Navigator.pushNamed(context, toolPath[index]);
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

List<String> tools = [
  global.title1,
  global.title2,
  global.title3,
  global.title4,
  global.title5,
];

List<String> toolPath = [
  '/gsm',
  '/yarn',
  '/mono',
  '/cover',
  '/yconsu',
];

List<String> toolTips = [
  global.desc1,
  global.desc2,
  global.desc3,
  global.desc4,
  global.desc5,
];

List<Icon> toolIcon = [
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
];
