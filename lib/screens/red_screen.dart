import 'dart:async';
import 'package:flutter/material.dart';
import 'package:football_match/utils/constants.dart';

class RedScreen extends StatefulWidget {
  const RedScreen({Key? key}) : super(key: key);

  @override
  RedScreenState createState() => RedScreenState();
}

class RedScreenState extends State<RedScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedColor,
      body: const Center(),
    );
  }
}
