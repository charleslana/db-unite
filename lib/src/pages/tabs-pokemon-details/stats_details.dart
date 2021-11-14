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
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsLevel'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsHP'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsAttack'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsDef'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsSpAttack'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsSpDef'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsCritRate'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsCDR'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
          ),
        ),
        DataColumn2(
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'pokemonDetailsStatsLifesteal'.tr,
              style: const TextStyle(color: ColorConstants.gray),
            ),
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
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '3000',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '170',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '52',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '20',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '36',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '0%',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '0%',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
            const DataCell(
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '0%',
                  style: TextStyle(color: ColorConstants.text),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
