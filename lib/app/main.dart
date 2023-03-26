import 'package:flutter/material.dart';
import 'dart:async';
import 'yellow_screen.dart';
import 'red_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _containerKey = GlobalKey();
  Color _containerColor = Colors.green.shade400;

  int _scoreA = 0;
  int _scoreB = 0;

  void _incrementScoreA() {
    setState(() {
      _scoreA++;
      _containerColor = Colors.blue.shade200;
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        if (timer.tick >= 7) {
          // stop timer after 2 seconds (7 * 300ms)
          timer.cancel();
          setState(() {
            _containerColor = Colors.green.shade400; // set color back to green
          });
        } else {
          setState(() {
            _containerColor = _containerColor == Colors.blue.shade200
                ? Colors.green.shade400
                : Colors.blue.shade200;
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
      _containerColor = Colors.red.shade200;
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        if (timer.tick >= 7) {
          // stop timer after 2 seconds (7 * 300ms)
          timer.cancel();
          setState(() {
            _containerColor = Colors.green.shade400; // set color back to green
          });
        } else {
          setState(() {
            _containerColor = _containerColor == Colors.red.shade200
                ? Colors.green.shade400
                : Colors.red.shade200;
          });
        }
      });
    });
  }

  void _decrementScoreB() {
    setState(() {
      _scoreB--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final screenDensity = mediaQueryData.devicePixelRatio;

    final fontSize = screenWidth / 20 * screenDensity;
    final buttonFontSize = screenWidth / 35 * screenDensity;

    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: _containerColor,
              height: screenHeight / 2,
              child: Center(
                child: Image.asset(
                  'assets/images/goal.gif',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
              key: _containerKey,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              height: screenHeight / 2,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: FittedBox(
                        child: Center(
                          child: Text(
                            '$_scoreA:$_scoreB',
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidth / 8,
                                  maxHeight: screenHeight / 12,
                                ),
                                child: ElevatedButton(
                                  onPressed: _incrementScoreA,
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight / 50,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidth / 8,
                                  maxHeight: screenHeight / 12,
                                ),
                                child: ElevatedButton(
                                  onPressed: _decrementScoreA,
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidth / 8,
                                  maxHeight: screenHeight / 12,
                                ),
                                child: ElevatedButton(
                                  onPressed: _incrementScoreB,
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight / 50,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: screenWidth / 8,
                                  maxHeight: screenHeight / 12,
                                ),
                                child: ElevatedButton(
                                  onPressed: _decrementScoreB,
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: screenWidth / 7 * screenDensity,
                              maxHeight: screenHeight / 12 * screenDensity,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => YellowScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor: Colors.yellow.shade300,
                                minimumSize: Size(
                                  screenWidth / 7 * screenDensity,
                                  screenHeight / 12 * screenDensity,
                                ),
                                maximumSize: Size(
                                  screenWidth / 7 * screenDensity,
                                  screenHeight / 12 * screenDensity,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Y',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth / 25),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: screenWidth / 7 * screenDensity,
                              maxHeight: screenHeight / 12 * screenDensity,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RedScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor: Colors.red.shade300,
                                minimumSize: Size(
                                  screenWidth / 7 * screenDensity,
                                  screenHeight / 12 * screenDensity,
                                ),
                                maximumSize: Size(
                                  screenWidth / 7 * screenDensity,
                                  screenHeight / 12 * screenDensity,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'R',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
