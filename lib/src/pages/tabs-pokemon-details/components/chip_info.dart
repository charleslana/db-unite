import 'package:flutter/material.dart';

class ChipInfo extends StatelessWidget {
  const ChipInfo({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: Chip(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.transparent,
        label: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
