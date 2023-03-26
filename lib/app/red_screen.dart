import 'dart:async';
import 'package:flutter/material.dart';

class RedScreen extends StatefulWidget {
  const RedScreen({Key? key}) : super(key: key);

  @override
  _RedScreenState createState() => _RedScreenState();
}

class _RedScreenState extends State<RedScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Center(),
    );
  }
}
