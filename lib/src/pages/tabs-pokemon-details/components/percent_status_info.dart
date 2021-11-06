import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentStatusInfo extends StatelessWidget {
  const PercentStatusInfo({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    final double percent = value * 10 / 100;

    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: ColorConstants.text,
                  fontSize: 16,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                  color: ColorConstants.text,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: LinearPercentIndicator(
            lineHeight: 8,
            percent: percent,
            backgroundColor: ColorConstants.background.withOpacity(0.4),
            progressColor: ColorConstants.orange,
          ),
        ),
      ],
    );
  }
}
