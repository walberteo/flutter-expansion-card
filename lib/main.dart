import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Expanded card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyItem {
  bool isExapanded;
  final String header;
  final Widget body;

  MyItem(this.isExapanded, this.header, this.body);
}

class _MyAppState extends State<MyApp> {
  var _items = List<MyItem>();

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      _items.add(
        MyItem(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                'Hello World Hello World Hello World Hello World Hello World ...'),
          ),
        ),
      );
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExapanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded card'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExapanded = !_items[index].isExapanded;
                });
              },
              children: _items.map(_createItem).toList(),
            )
          ],
        ),
      ),
    );
  }
}
