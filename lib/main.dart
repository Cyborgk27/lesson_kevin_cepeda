import 'package:flutter/material.dart';
import 'package:lesson_kevin_cepeda/screens/kevin_cepeda_home.dart';
import 'package:lesson_kevin_cepeda/screens/kevin_cepeda_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson Kevin Cepeda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      routes: {
        'login': (_) => const KevinCepedaLogin(),
        'home': (_) => const KevinCepedaHome()
      },
      initialRoute: 'login',
    );
  }
}