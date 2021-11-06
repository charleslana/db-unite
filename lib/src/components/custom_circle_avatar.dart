import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.image,
    required this.height,
    this.isNetwork = false,
    Key? key,
  }) : super(key: key);

  final String image;
  final double height;
  final bool isNetwork;

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
            child: isNetwork
                ? CachedNetworkImage(
                    placeholder: (_, __) => const PokeballLoading(),
                    imageUrl: image,
                    fit: BoxFit.fill,
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
