import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    required this.title,
    required this.value,
    this.isOpacity = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;
  final bool isOpacity;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: isOpacity
          ? ColorConstants.background.withOpacity(0.5)
          : Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: ColorConstants.text,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorConstants.text,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
