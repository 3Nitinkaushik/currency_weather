import 'package:flutter/material.dart';

class Currencyscreen extends StatefulWidget {

  Currencyscreen({Key? key}) : super(key: key);

  @override
  State<Currencyscreen> createState() => _CurrencyscreenState();
}

class _CurrencyscreenState extends State<Currencyscreen> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(height: 30,width: 30,color: Colors.green,child: Text(""),),
      ],
    );
  }
}
