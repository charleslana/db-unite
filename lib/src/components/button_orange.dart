import 'package:flutter/material.dart';

class ButtonOrange extends StatelessWidget {
  const ButtonOrange({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrangeAccent,
        onPrimary: Colors.white,
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}
