import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';
import 'package:rastreo_paquetes_app/styles/fonts/fonts_view.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      height: 60,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: ColorSelect.kColorPrimary,
          side: const BorderSide(color: ColorSelect.kColorPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        child: Text(text, style: FontSelect.k18WhiteBold),
      ),
    );
  }
}
