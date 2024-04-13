import 'package:flutter/material.dart';
import 'package:app8/screens/home.dart';

void main() => runApp(const MyApp8());

class MyApp8 extends StatelessWidget {
  const MyApp8({super.key});

  @override
  Widget build(BuildContext context) {
    const String tituloApp = 'Listado de paises';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: tituloApp,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: HomeScreen(
        titulo: tituloApp,
      ),
    );
  }
}
