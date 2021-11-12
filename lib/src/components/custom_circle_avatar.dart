import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.image,
    required this.height,
    this.heroTag,
    Key? key,
  }) : super(key: key);

  final String image;
  final double height;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final double radius = height / 2;
    final double radiusBorder = radius + 4;

    return CircleAvatar(
      radius: radiusBorder,
      backgroundColor: ColorConstants.background,
      child: CircleAvatar(
        radius: radius,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            height: height,
            color: ColorConstants.avatar,
            child: heroTag != null
                ? Hero(
                    tag: heroTag!,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  )
                : Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      ),
    );
  }
}
