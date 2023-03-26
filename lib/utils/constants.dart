import 'package:flutter/material.dart';

// Colors
const kContainerColor =
    Colors.green; //common practice to prefix constant names with k (e.g. in C)
final kBlueColor = Colors.blue.shade200;
final kGreenColor = Colors.green.shade400;
final kRedColor = Colors.red.shade200;
final kYellowColor = Colors.yellow.shade300;
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;

// TextStyle
const kScoreTextStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  height: 1.0,
  color: kBlackColor,
);

const kButtonTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// Duration
const kTimerDuration = Duration(milliseconds: 100);
const kTimerTicks = 7;
