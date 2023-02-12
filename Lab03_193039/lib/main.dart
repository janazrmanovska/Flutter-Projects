import 'package:flutter/material.dart';

import 'model/list_item.dart';
import 'widgets/nov_element.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(primarySwatch: Colors.purple),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _userItems = [
    ListItem(
        id: "T1",
        naslov: "Дискретна математика",
        date: DateTime.parse("2023-02-23 13:27")),
    ListItem(
        id: "T2",
        naslov: "Структурно програмирање",
        date: DateTime.parse("2023-02-24 13:30")),
    ListItem(
        id: "T3",
        naslov: "Бизнис статистика",
        date: DateTime.parse("2023-02-25 13:30")),
    ListItem(
        id: "T4",
        naslov: "Оперативни системи",
        date: DateTime.parse("2023-02-26 13:30")),
  ];

  void _addItemFunction(BuildContext ct) {
    // var newElement = ListItem(id: "T1", naslov: "Test 1", vrednost: 13);
    //
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NovElement(_addNewItemToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(ListItem item) {
    setState(() {
      _userItems.add(item);
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _userItems.removeWhere((elem) => elem.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kolokviumska nedela"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add), onPressed: () => _addItemFunction(context))
      ]),
      body: Center(
        child: _userItems.isEmpty
            ? Text("No elements")
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    child: ListTile(
                      title: Text(_userItems[index].naslov,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "${_userItems[index].date.year}-0${_userItems[index].date.month}-${_userItems[index].date.day} ${_userItems[index].date.hour}:${_userItems[index].date.minute}",
                          style: TextStyle(color: Colors.grey)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteItem(_userItems[index].id),
                      ),
                    ),
                  );
                },
                itemCount: _userItems.length,
              ),
      ),
    );
  }
}
