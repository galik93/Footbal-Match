import 'dart:async';
import 'package:flutter/material.dart';

class YellowScreen extends StatefulWidget {
  const YellowScreen({Key? key}) : super(key: key);

  @override
  _YellowScreenState createState() => _YellowScreenState();
}

class _YellowScreenState extends State<YellowScreen> {
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
      backgroundColor: Colors.yellow.shade300,
      body: Center(),
    );
  }
}
