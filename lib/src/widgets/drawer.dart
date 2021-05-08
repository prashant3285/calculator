import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget drawerMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 65,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('CALCULATORS',
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          ),
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.arrowCircleRight,
          ),
          title: Text('GSM'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/gsm');
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.arrowCircleRight,
          ),
          title: Text('YARN COUNT'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/yarn');
          },
        ),
        ListTile(
          leading: FaIcon(
            FontAwesomeIcons.arrowCircleRight,
          ),
          title: Text('DIAMETER'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/mono');
          },
        ),
      ],
    ),
  );
}
