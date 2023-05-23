import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/services/email_sign_in.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';
import 'package:rastreo_paquetes_app/styles/fonts/fonts_view.dart';
import 'package:rastreo_paquetes_app/widgets/button_next.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    EmailSigninService()
        .registerUserWithEmailAndPassword(
            _emailController.text.trim(), _passwordController.text.trim())
        .then(
          (value) => value == true
              ? Future.delayed(
                  const Duration(seconds: 2),
                  () => Navigator.pushNamed(context, '/menu'),
                )
              : showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        'Error al registrar el usuario, intente de nuevo'),
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
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
                        '¿No tienes cuenta?',
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
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
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
                            child: TextField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
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
                          ButtonNext(
                              onPressed: _register, text: 'Crear cuenta'),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Ya tienes una cuenta? ',
                                  style: FontSelect.k16Black),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/signin'),
                                child: const Text('Inicia sesión',
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
