import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TANIA ANGGITIA AUDINA'),
        ),
        body: TaniaApp(),
      ),
    );
  }
}

class TaniaApp extends StatefulWidget {
  _TaniaAppState createState() => _TaniaAppState();
}

class _TaniaAppState extends State<TaniaApp> {
  final txtnama = TextEditingController();
  String _selected;
  String hasil;
  onProses() {
    setState(() {
      hasil = "${txtnama.text} pesan buku $_selected";
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          TextField(
            controller: txtnama,
            decoration: new InputDecoration(
              labelText: "pesan buku",
            ),
          ),
          DropdownButton(
              hint: Text("Pilihan buku"),
              value: _selected,
              items: ['dongeng sebelum tidur', 'si kancil', 'putri tidur']
                  .map((choice) {
                return DropdownMenuItem(
                  child: Text(choice),
                  value: choice,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              }),
          RaisedButton(
            child: Text('Proses'),
            onPressed: onProses,
          ),
          Text('$hasil')
        ]));
  }
}
