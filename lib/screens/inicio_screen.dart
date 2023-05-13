import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';
import 'package:rastreo_paquetes_app/styles/fonts/fonts_view.dart';
import 'package:rastreo_paquetes_app/widgets/button_next.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorSelect.kBlack.withOpacity(.50),
                ColorSelect.kBlack.withOpacity(.50),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                color: ColorSelect.kWhite.withOpacity(.80),
                colorBlendMode: BlendMode.modulate,
              ),
              Column(
                children: [
                  ButtonNext(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    text: 'Iniciar sesión',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No tienes una cuenta? ',
                          style: FontSelect.k16White),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/signup'),
                        child: const Text('Crea una',
                            style: FontSelect.k16PrimaryColorUnderline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
