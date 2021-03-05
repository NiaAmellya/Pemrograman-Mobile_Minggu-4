import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.etCelcius,
  }) : super(key: key);

  final TextEditingController etCelcius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etCelcius,
      decoration:
          const InputDecoration(hintText: "Masukkan Suhu dalam Celcius"),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
