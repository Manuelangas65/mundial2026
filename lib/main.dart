import 'package:flutter/material.dart';

import 'pages/partidos_page.dart';

void main() {

  // punto de entrada principal de la aplicación
  runApp(
    const MyApp(),
  );

}

class MyApp
    extends StatelessWidget {

  const MyApp({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {

    return MaterialApp(

      // quita la etiqueta de debug de flutter
      debugShowCheckedModeBanner:
          false,

      title: 'Mundial 2026',

      // tema general de la aplicación
      theme: ThemeData(
        useMaterial3: true,
      ),

      // pantalla inicial que se mostrará al abrir la app
      home: const PartidosPage(),

    );
  }
}