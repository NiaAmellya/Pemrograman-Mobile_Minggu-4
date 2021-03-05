import 'package:flutter/material.dart';

class DropdownKonversi extends StatelessWidget {
  const DropdownKonversi({
    Key key,
    @required this.listItem,
    @required String valueDropDown,
    @required this.dropDownChange,
  })  : _valueDropDown = valueDropDown,
        super(key: key);

  final List<String> listItem;
  final String _valueDropDown;
  final Function dropDownChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ); //untuk menampilkan semua data yang ada di listitem
      }).toList(),
      value: _valueDropDown,
      onChanged: dropDownChange,
    );
  }
}
