import 'dart:html';

import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

import '/model/list_item.dart';

class NovElement extends StatefulWidget {
  final Function addItem;

  NovElement(this.addItem);
  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _naslovController = TextEditingController();
  final _datumController = TextEditingController();

  String naslov = " ";
  DateTime date = DateTime.now();
  void _submitData() {
    if (_datumController.text.isEmpty) {
      return;
    }
    final vnesenNaslov = _naslovController.text;
    final vnesenDatum = DateTime.parse(_datumController.text);

    if (vnesenNaslov.isEmpty ||
        vnesenDatum.isAfter(DateTime.parse("2023-02-28 23:59:59")) ||
        vnesenDatum.isBefore(DateTime.parse("2023-01-31 23:59:59"))) {
      return;
    }

    final newItem =
        ListItem(id: nanoid(5), naslov: vnesenNaslov, date: vnesenDatum);
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _naslovController,
            decoration: InputDecoration(labelText: "Наслов на колоквиумот"),
            //  onChanged: (val) {
            //    naslov = val;
            //  }
            onSubmitted: (_) => _submitData(),
          ),
          Text("Колоквиумската недела е во февруари",
              textAlign: TextAlign.start),
          TextField(
            controller: _datumController,
            decoration: InputDecoration(labelText: "Датум и време"),
            keyboardType: TextInputType.datetime,
            //  onChanged: (val) {
            //    naslov = val;
            //  }
            onSubmitted: (_) => _submitData(),
          ),
          ElevatedButton(child: Text("Додај"), onPressed: _submitData)
        ],
      ),
    );
  }
}
