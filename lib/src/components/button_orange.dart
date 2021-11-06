import 'package:db_unite/src/constants/image_constants.dart';
import 'package:flutter/material.dart';

class ButtonOrange extends StatelessWidget {
  const ButtonOrange({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: 88,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.deepOrangeAccent,
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset(ImageConstants.pokeball),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
