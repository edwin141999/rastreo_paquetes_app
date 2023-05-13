import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/screens/inicio_screen.dart';
import 'package:rastreo_paquetes_app/screens/menu_screen.dart';
import 'package:rastreo_paquetes_app/screens/sign_in_screen.dart';
import 'package:rastreo_paquetes_app/screens/sign_up_screen.dart';
import 'package:rastreo_paquetes_app/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubitec',
      theme: ThemeData(fontFamily: 'Nunito'),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/inicio': (context) => const InicioScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/menu' : (context) => const MenuScreen(),
      },
    );
  }
}
