import 'package:flutter/material.dart';
import 'package:football_match/utils/constants.dart';

class NavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  final double screenWidth;

  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenWidth / 7,
        maxHeight: screenHeight / 12,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: buttonColor,
          minimumSize: Size(screenWidth / 7, screenHeight / 12),
          maximumSize: Size(screenWidth / 7, screenHeight / 12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
