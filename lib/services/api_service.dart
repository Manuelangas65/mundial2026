import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/partido.dart';

class ApiService {
  static const String baseUrl = "http://localhost:3000";

  // Método para obtener partidos
  static Future<List<Partido>> obtenerPartidos(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/partidos'),
      headers: {
        "Authorization": "Bearer $token", // El backend corregido ya leerá esto perfecto
      },
    );

    print("Partidos - Código del servidor: ${response.statusCode}");
    print("Partidos - Cuerpo recibido: ${response.body}");

    if (response.statusCode == 200) {
      final List datos = jsonDecode(response.body);
      return datos.map((e) => Partido.fromJson(e)).toList();
    }

    throw Exception('Error al obtener partidos');
  }

  // Método para actualizar marcador
  static Future<void> actualizarMarcador({
    required int idPartido,
    required int golesE1,
    required int golesE2,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl/partidos/$idPartido'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"goles_e1": golesE1, "goles_e2": golesE2}),
    );

    if (response.statusCode != 200) {
      throw Exception("Error al guardar marcador");
    }
  }

  // Método para iniciar sesión limpia
static Future<String> login(String usuario, String password) async {
    try {
      final response = await http.post(
        // 👇 AQUÍ: Le agregamos el /login al final de la ruta
        Uri.parse('$baseUrl/aut/login'), 
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usuario.trim(),
          "password": password.trim(),
        }),
      );

      print("Código de respuesta del servidor: ${response.statusCode}");
      print("Cuerpo recibido: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> datos = jsonDecode(response.body);
        return datos['token'].toString(); 
      }
      
      throw Exception('Código del servidor: ${response.statusCode}');
    } catch (e) {
      print("Error detectado en ApiService: $e");
      throw Exception('Credenciales incorrectas');
    }
  }
}