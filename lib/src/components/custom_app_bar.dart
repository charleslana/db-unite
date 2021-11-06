import 'package:db_unite/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(title),
      centerTitle: true,
      backgroundColor: ColorConstants.appBarBackground,
    );
  }
}
