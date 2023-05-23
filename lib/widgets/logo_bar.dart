import 'package:flutter/material.dart';

class LogoBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Image.asset('assets/logo.png', height: 100),
      automaticallyImplyLeading: false,
    );
  }
}
