import 'package:flutter/material.dart';
import 'package:pakaian_adat_app/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pakaian Adat Indonesia',
      home: SplashScreenHome(),
    );
  }
}
