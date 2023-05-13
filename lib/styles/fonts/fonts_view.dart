import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';

class FontSelect {
  static const k18WhiteBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const k16White = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const k16Black = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static const k16PrimaryColorUnderline = TextStyle(
    fontSize: 16,
    color: ColorSelect.kColorPrimary,
    decoration: TextDecoration.underline,
  );
}
