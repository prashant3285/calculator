import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../global/var.dart' as global;
import '../global/custom_icons.dart';

const _url = 'https://github.com/prashant3285/calculator/';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    searchTool.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textile Calculator'),
        centerTitle: true,
      ),
      drawer: drawerMenu(context),
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Column(
          children: [
            Text(
              'This is an opensource project. Post Tool/Calculator request on Github Issues',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
            InkWell(
              child: Text(
                'https://github.com/prashant3285/calculator',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber[200], fontSize: 10),
              ),
              onTap: () {
                _launchURL();
              },
            ),
            Divider(),
            TextField(
              controller: editingController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                  isDense: true,
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      editingController.clear();
                      setState(() {});
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
            Expanded(
              child: searchTool.length != 0 || editingController.text.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchTool.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              '${tool[searchTool[index].toInt()]}',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            leading: toolIcon[searchTool[index]],
                            subtitle: Text(
                              '${toolTips[searchTool[index]]}',
                              style: (TextStyle(
                                fontSize: 12,
                              )),
                            ),
                            focusColor: Colors.amber,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, toolPath[searchTool[index]]);
                            },
                          ),
                        );
                      },
                    )
                  : ListView.builder(
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
                            subtitle: Text(
                              '${toolTips[index]}',
                              style: (TextStyle(
                                fontSize: 12,
                              )),
                            ),
                            focusColor: Colors.amber,
                            onTap: () {
                              searchTool.clear();
                              Navigator.pushNamed(context, toolPath[index]);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void filterSearchResults(String query) {
    bool repeat = true;
    if (query.isEmpty) {
      setState(() {
        searchTool.clear();
        print('Clear');
      });
      return;
    }
    if (query.isNotEmpty) {
      searchTool.clear();
      tool.forEach((item) {
        if (item.toUpperCase().contains(query.toUpperCase())) {
          int position = tool.indexOf(item);
          if (searchTool.isNotEmpty) {
            searchTool.forEach((element) {
              if (element != position) {
                repeat = false;
              }
            });
            if (!repeat) {
              searchTool.add(position);
              repeat = true;
            }
          } else {
            searchTool.add(position);
          }

          // searchTool.add(item.indexOf(item));
          // print(searchTool.length.toString());
        }
        setState(() {});
      });
    }
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

List<String> tool = [
  global.title1,
  global.title2,
  global.title3,
  global.title4,
  global.title5,
  global.title6,
  global.title7,
  global.title8,
];

List<String> toolPath = [
  '/gsm',
  '/yarn',
  '/mono',
  '/cover',
  '/yconsu',
  '/gsmw',
  '/clothd',
  '/yarncont',
];

List<String> toolTips = [
  global.desc1,
  global.desc2,
  global.desc3,
  global.desc4,
  global.desc5,
  global.desc6,
  global.desc7,
  global.desc8,
];

List<Icon> toolIcon = [
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
  Icon(CustomIcon.textile),
  Icon(CustomIcon.textile),
  Icon(CustomIcon.yarn_2_),
];

List<int> searchTool = [];
