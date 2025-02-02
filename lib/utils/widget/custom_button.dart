import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.buttonColor,
  });
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: buttonColor,
      ),
      child: Text(
        text,
        // 'App GitHub Repository',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
