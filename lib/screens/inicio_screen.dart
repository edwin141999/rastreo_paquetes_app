import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/services/email_sign_in.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';
import 'package:rastreo_paquetes_app/styles/fonts/fonts_view.dart';
import 'package:rastreo_paquetes_app/widgets/button_next.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  Future<void> _signOut() async {
    await EmailSigninService().signOutUser().then(
          (value) => value == true
              ? Future.delayed(
                  const Duration(seconds: 2),
                  () => Navigator.pushNamed(context, '/signin'),
                )
              : showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Error al cerrar sesión'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                ),
        );
  }

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
                  ButtonNext(onPressed: _signOut, text: 'Iniciar sesión'),
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
