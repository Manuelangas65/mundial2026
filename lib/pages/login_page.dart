import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../sesion.dart'; // Importamos tu archivo de sesión
import 'partidos_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // NOTA: Como no pusiste tu JSON de auth, asumiremos que usas estos controladores
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _cargando = false;

  Future<void> iniciarSesion() async {
    setState(() => _cargando = true);

    try {
      // 1. Aquí llamaremos al método de login (lo agregaremos al ApiService en el paso 2)
      String tokenRecibido = await ApiService.login(
        _usuarioController.text,
        _passwordController.text,
      );

      // 2. Guardamos el token en tu variable global de sesion.dart
      token = tokenRecibido;

      if (!mounted) return;

      // 3. Navegamos a la página de partidos pasándole el token real
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PartidosPage(token: tokenRecibido),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al iniciar sesión: ${e.toString()}")),
      );
    } finally {
      setState(() => _cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MUNDIAL 2026",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usuarioController,
                decoration: const InputDecoration(
                  labelText: "Usuario o Correo",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              _cargando
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: iniciarSesion,
                        child: const Text("INGRESAR", style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}