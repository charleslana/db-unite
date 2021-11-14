import 'package:db_unite/src/components/custom_circle_avatar.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EvolutionInfo extends StatelessWidget {
  const EvolutionInfo({
    required this.name,
    required this.level,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String name;
  final int level;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleAvatar(
          image: ImageConstants().getPokemonThumbnail(image),
          height: 60,
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            color: ColorConstants.yellow,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'pokemonDetailsInfoEvolvesAt'.trParams({'level': level.toString()}),
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'HelveticaNeueLTProLight',
            color: ColorConstants.gray,
          ),
        ),
      ],
    );
  }
}
