import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class StatsDetails extends StatelessWidget {
  const StatsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => ColorConstants.appBarBackground),
          columns: [
            DataColumn(
              label: Text(
                'pokemonDetailsStatsLevel'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsHP'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsAttack'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsDef'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsSpAttack'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsSpDef'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsCritRate'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
              label: Text(
                'pokemonDetailsStatsCDR'.tr,
                style: const TextStyle(color: ColorConstants.gray),
              ),
            ),
            DataColumn(
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
              cells: const [
                DataCell(
                  Text(
                    '1',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '3000',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '170',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '52',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '20',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '36',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '0%',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '0%',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
                DataCell(
                  Text(
                    '0%',
                    style: TextStyle(color: ColorConstants.text),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
