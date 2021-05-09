import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://kamlatech.in/';

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
          leading: MenuIcon(Icons.calculate_outlined),
          title: MenuText('GSM'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/gsm');
          },
        ),
        ListTile(
          leading: MenuIcon(Icons.calculate_outlined),
          title: MenuText('Yarn Count'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/yarn');
          },
        ),
        ListTile(
          leading: MenuIcon(Icons.calculate_outlined),
          title: MenuText('Diameter'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/mono');
          },
        ),
        ListTile(
          leading: MenuIcon(Icons.calculate_outlined),
          title: MenuText('FabricCover'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/cover');
          },
        ),
        ListTile(
          leading: MenuIcon(Icons.home),
          title: MenuText('Home'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
        ListTile(
          leading: MenuIcon(Icons.language),
          title: MenuText('Kamlatech'),
          onTap: () {
            _launchURL();
          },
        ),
      ],
    ),
  );
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

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
