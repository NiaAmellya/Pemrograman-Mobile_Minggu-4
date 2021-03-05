import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'DropdownKonversi.dart';
import 'RiwayatKonversi.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etCelcius = new TextEditingController();

  List<String> listViewItem = List<String>();
  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];
  String _valueDropDown = "Kelvin";

  double nCelcius = 0;
  double nReamur = 0;
  double nKelvin = 0;
  double nFahrenheit = 0;
  double result = 0;
  void konversiSuhu() {
    setState(() {
      nCelcius = double.parse(etCelcius.text);
      if (_valueDropDown == "Kelvin") {
        result = nCelcius + 273;
        listViewItem.insert(0, "Kelvin : " + result.toStringAsFixed(2));
      } else if (_valueDropDown == "Reamur") {
        result = (4 / 5) * nCelcius;
        listViewItem.insert(
            0,
            "Reamur : " +
                result.toStringAsFixed(2)); // untuk menampung hasil perhitungan

      } else
        result = ((9 / 5) * nCelcius) + 32;
      listViewItem.insert(0, "Fahrenheit : " + result.toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etCelcius: etCelcius),
              DropdownKonversi(
                  listItem: listItem,
                  valueDropDown: _valueDropDown,
                  dropDownChange: dropDownChange),
              Result(result: result),
              Convert(konvertHandler: konversiSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: RiwayatKonversi(listViewItem: listViewItem),
              )
            ],
          ),
        ),
      ),
    );
  }

  void dropDownChange(String changeValue) {
    setState(() {
      _valueDropDown = changeValue;
      konversiSuhu();
    });
  }
}
