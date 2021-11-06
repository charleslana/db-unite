import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_info.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/chip_info.dart';
import 'package:flutter/material.dart';

class InfoDetails extends StatelessWidget {
  const InfoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                CachedNetworkImage(
                  placeholder: (_, __) => const PokeballLoading(),
                  imageUrl:
                      'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/portrait/359.png',
                  fit: BoxFit.fitWidth,
                  height: 200,
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Special Attacker',
                      style: TextStyle(
                        color: ColorConstants.specialAttacker,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: const [
                    ChipInfo(text: 'Ranged'),
                    ChipInfo(text: 'Intermediate'),
                    ChipInfo(text: 'Defender'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: const [
                CardInfo(
                  title: 'HP',
                  value: '3000',
                  isOpacity: true,
                ),
                CardInfo(
                  title: 'Attack',
                  value: '150',
                  isOpacity: false,
                ),
                CardInfo(
                  title: 'Defense',
                  value: '100',
                  isOpacity: true,
                ),
                CardInfo(
                  title: 'Sp. Attack',
                  value: '50',
                  isOpacity: false,
                ),
                CardInfo(
                  title: 'Sp. Defense',
                  value: '70',
                  isOpacity: true,
                ),
                CardInfo(
                  title: 'Crit Rate',
                  value: '0%',
                  isOpacity: false,
                ),
                CardInfo(
                  title: 'CD Reduction',
                  value: '0%',
                  isOpacity: true,
                ),
                CardInfo(
                  title: 'Lifesteal',
                  value: '0%',
                  isOpacity: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
