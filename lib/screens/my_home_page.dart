import 'package:flutter/material.dart';
import 'package:football_match/screens/red_screen.dart';
import 'package:football_match/screens/yellow_screen.dart';
import 'package:football_match/utils/constants.dart';
import 'package:football_match/widgets/increment_decrement_button.dart';
import 'package:football_match/widgets/navigation_button.dart';
import 'package:football_match/widgets/score_board.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _scoreA = 0;
  int _scoreB = 0;
  Color _containerColor = kContainerColor;

  void _incrementScoreA() {
    setState(() {
      _scoreA++;
      _containerColor = kBlueColor;
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (timer.tick >= 7) {
          // stop timer after 2 seconds (7 * 300ms)
          timer.cancel();
          setState(() {
            _containerColor = kContainerColor; // set color back to green
          });
        } else {
          setState(() {
            _containerColor =
                _containerColor == kBlueColor ? kContainerColor : kBlueColor;
          });
        }
      });
    });
  }

  void _decrementScoreA() {
    setState(() {
      if (_scoreA > 0) {
        _scoreA--;
      }
    });
  }

  void _incrementScoreB() {
    setState(() {
      _scoreB++;
      _containerColor = kRedColor;
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (timer.tick >= 7) {
          // stop timer after 2 seconds (7 * 300ms)
          timer.cancel();
          setState(() {
            _containerColor = kContainerColor; // set color back to green
          });
        } else {
          setState(() {
            _containerColor =
                _containerColor == kRedColor ? kContainerColor : kRedColor;
          });
        }
      });
    });
  }

  void _decrementScoreB() {
    setState(() {
      if (_scoreB > 0) {
        _scoreB--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final screenDensity = mediaQueryData.devicePixelRatio;

    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: _containerColor,
              height: screenHeight / 2,
              key: GlobalKey(),
              child: Center(
                child: Image.asset(
                  'assets/images/goal.gif',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              height: screenHeight / 2,
              child: Column(
                children: [
                  Expanded(
                    child: ScoreBoard(
                      scoreA: _scoreA,
                      scoreB: _scoreB,
                      screenWidth: screenWidth,
                      screenDensity: screenDensity,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IncrementDecrementButton(
                              screenWidth: screenWidth,
                              buttonColor: kWhiteColor,
                              onPressed: _incrementScoreA,
                              text: '+',
                            ),
                            const SizedBox(height: 16),
                            IncrementDecrementButton(
                              screenWidth: screenWidth,
                              buttonColor: kWhiteColor,
                              onPressed: _decrementScoreA,
                              text: '-',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IncrementDecrementButton(
                              screenWidth: screenWidth,
                              buttonColor: kWhiteColor,
                              onPressed: _incrementScoreB,
                              text: '+',
                            ),
                            const SizedBox(height: 16),
                            IncrementDecrementButton(
                              screenWidth: screenWidth,
                              buttonColor: kWhiteColor,
                              onPressed: _decrementScoreB,
                              text: '-',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NavigationButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const YellowScreen()),
                            );
                          },
                          screenWidth: screenWidth,
                          text: 'Y',
                          buttonColor: kYellowColor,
                        ),
                        SizedBox(width: screenWidth / 25),
                        NavigationButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RedScreen()),
                            );
                          },
                          screenWidth: screenWidth,
                          text: 'R',
                          buttonColor: kRedColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
