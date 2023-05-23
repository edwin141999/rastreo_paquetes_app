import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _toOnboarding();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _toOnboarding() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/inicio');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                color: ColorSelect.kWhite.withOpacity(.80),
                colorBlendMode: BlendMode.modulate,
              ),
            )
          ],
        ),
      ),
    );
  }
}
