import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({Key key, @required this.konvertHandler}) : super(key: key);
  final Function konvertHandler;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
      ),
    );
  }
}
