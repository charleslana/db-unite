import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

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
        label: 'Fechar',
        textColor: ColorConstants.text,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
