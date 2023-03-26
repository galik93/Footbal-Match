import 'dart:async';
import 'package:flutter/material.dart';
import 'package:football_match/utils/constants.dart';

class YellowScreen extends StatefulWidget {
  const YellowScreen({Key? key}) : super(key: key);

  @override
  YellowScreenState createState() => YellowScreenState();
}

class YellowScreenState extends State<YellowScreen> {
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
      backgroundColor: kYellowColor,
      body: const Center(),
    );
  }
}
