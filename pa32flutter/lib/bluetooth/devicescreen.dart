import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pa32/bluetooth/widgets.dart';


class devicescren extends StatefulWidget {
  const devicescren({Key? key}) : super(key: key);

  @override
  State<devicescren> createState() => _devicescrenState();
}

class _devicescrenState extends State<devicescren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Found'),
      ),
    );
  }
}
