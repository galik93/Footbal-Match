import 'package:flutter/material.dart';
import 'package:football_match/utils/constants.dart';

class ScoreBoard extends StatelessWidget {
  final int scoreA;
  final int scoreB;
  final double screenWidth;
  final double screenDensity;

  const ScoreBoard({
    Key? key,
    required this.scoreA,
    required this.scoreB,
    required this.screenWidth,
    required this.screenDensity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Center(
        child: Text(
          '$scoreA:$scoreB',
          style: kScoreTextStyle,
        ),
      ),
    );
  }
}
