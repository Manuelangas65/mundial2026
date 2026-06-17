import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/partido.dart';

// esta clase contiene todos los metodos necesarios
// para comunicarnos con nuestra API en node
class ApiService {

  // direccion base donde se encuentra corriendo el backend
  static const String baseUrl =
    "http://localhost:3000";

  // este metodo realiza un GET para obtener todos los partidos
  // registrados actualmente en la base de datos
  static Future<List<Partido>> obtenerPartidos() async {

    final response =
        await http.get(
      Uri.parse(
        '$baseUrl/partidos',
      ),
    );

    // si la respuesta fue exitosa convertimos el json
    // recibido en una lista de objetos Partido
    if (response.statusCode == 200) {

      final List datos =
          jsonDecode(response.body);

      return datos
          .map(
            (e) => Partido.fromJson(e),
          )
          .toList();

    }

    // si hubo algun problema lanzamos una excepcion
    throw Exception(
      'Error al obtener partidos',
    );
  }

  // este metodo realiza un PUT para actualizar
  // los goles de un partido especifico
  static Future<void> actualizarMarcador({
    required int idPartido,
    required int golesE1,
    required int golesE2,
  }) async {

    final response =
        await http.put(
      Uri.parse(
        '$baseUrl/partidos/$idPartido',
      ),
      headers: {
        "Content-Type":
            "application/json"
      },
      body: jsonEncode({
        "goles_e1": golesE1,
        "goles_e2": golesE2,
      }),
    );

    // si el servidor no responde correctamente
    // mostramos un error para saber que no se guardo el marcador
    if (response.statusCode != 200) {
      throw Exception(
        "Error al guardar marcador",
      );
    }
  }
}