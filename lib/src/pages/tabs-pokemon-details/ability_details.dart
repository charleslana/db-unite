import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:flutter/material.dart';

class AbilityDetails extends StatelessWidget {
  const AbilityDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Card(
        elevation: 0,
        color: ColorConstants.background.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    placeholder: (_, __) => const PokeballLoading(),
                    imageUrl:
                        'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/009/ability/Water_Gun.png',
                    fit: BoxFit.fill,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Water Gun',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorConstants.text,
                        ),
                      ),
                      const Text(
                        'Move 1',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.gray,
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorConstants.yellow,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.timelapse,
                                        size: 15,
                                        color: ColorConstants.yellow,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 9s',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: ColorConstants.deepRed,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Image.asset(
                                        ImageConstants.skillRanged,
                                        width: 15,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' Ranged',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
