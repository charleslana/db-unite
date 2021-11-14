import 'package:data_table_2/data_table_2.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class StatsDetails extends StatelessWidget {
  const StatsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonDetailsController pokemonDetailsController =
        Get.put(PokemonDetailsController());

    return DataTable2(
      scrollController: pokemonDetailsController.scrollControllerStats,
      columnSpacing: 12,
      horizontalMargin: 12,
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => ColorConstants.appBarBackground),
      columns: [
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsLevel'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsHP'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsAttack'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsDef'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsSpAttack'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsSpDef'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsCritRate'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsCDR'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
        DataColumn2(
          label: Text(
            'pokemonDetailsStatsLifesteal'.tr,
            style: const TextStyle(color: ColorConstants.gray),
          ),
        ),
      ],
      rows: List.generate(15, (index) {
        return DataRow(
          color: MaterialStateColor.resolveWith((states) {
            return index % 2 == 0
                ? Colors.transparent
                : ColorConstants.background.withOpacity(0.2);
          }),
          cells: [
            DataCell(
              Text(
                (index + 1).toString(),
                style: const TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '3000',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '170',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '52',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '20',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '36',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '0%',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '0%',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
            const DataCell(
              Text(
                '0%',
                style: TextStyle(color: ColorConstants.text),
              ),
            ),
          ],
        );
      }),
    );
  }
}
