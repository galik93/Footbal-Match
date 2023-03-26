import 'package:flutter/material.dart';
import 'package:football_match/utils/constants.dart';

class IncrementDecrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  final double screenWidth;

  const IncrementDecrementButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 8,
        maxHeight: MediaQuery.of(context).size.height / 12,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: buttonColor,
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
