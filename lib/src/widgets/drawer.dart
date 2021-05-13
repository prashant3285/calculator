import 'package:flutter/material.dart';

import '../global/var.dart' as global;
import '../global/custom_icons.dart';

const _url = 'https://kamlatech.in/';

Widget drawerMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        Container(
          height: 75,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
                icon: Icon(Icons.home_rounded),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                }),
          ),
        ),
        Container(
          height: double.maxFinite,
          child: ListView.builder(
            itemCount: tool.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    '${tool[index]}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  leading: toolIcon[index],
                  focusColor: Colors.amber,
                  onTap: () {
                    Navigator.pushNamed(context, toolPath[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

// void _launchURL() async =>
//     await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class MenuText extends StatelessWidget {
  late final String label;

  MenuText(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  late final IconData menuIcon;

  MenuIcon(this.menuIcon);

  @override
  Widget build(BuildContext context) {
    return Icon(
      menuIcon,
      size: 25,
      color: Theme.of(context).accentColor,
    );
  }
}

List<String> tool = [
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

List<Icon> toolIcon = [
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
];
