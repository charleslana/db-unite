import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Utils {
  void snackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: ColorConstants.appBarBackground,
      content: Text(
        message,
        style: const TextStyle(
          color: ColorConstants.text,
          fontFamily: 'HelveticaNeueLTProMedium',
        ),
      ),
      action: SnackBarAction(
        onPressed: () {},
        label: 'utilsCloseSnackbar'.tr,
        textColor: ColorConstants.text,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
