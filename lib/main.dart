import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Importa la nueva pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mundial 2026',
      theme: ThemeData(useMaterial3: true),
      home: const LoginPage(), // <-- Cambiamos PartidosPage por LoginPage
    );
  }
}