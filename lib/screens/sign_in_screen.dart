import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';
import 'package:rastreo_paquetes_app/styles/fonts/fonts_view.dart';
import 'package:rastreo_paquetes_app/widgets/button_next.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                Container(
                  decoration: BoxDecoration(
                    color: ColorSelect.kWhite,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Bienvenido',
                        style: TextStyle(
                          color: ColorSelect.kBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintStyle: FontSelect.k16Black,
                                border: UnderlineInputBorder(),
                                labelText: 'Correo electrónico',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorSelect.kColorPrimary,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorSelect.kColorPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintStyle: FontSelect.k16Black,
                                border: UnderlineInputBorder(),
                                labelText: 'Contraseña',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorSelect.kColorPrimary,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorSelect.kColorPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ButtonNext(onPressed: () {}, text: 'Iniciar sesión'),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('No tienes una cuenta? ',
                                  style: FontSelect.k16Black),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/signup'),
                                child: const Text('Crea una',
                                    style: FontSelect.k16PrimaryColorUnderline),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
