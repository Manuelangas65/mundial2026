// esta clase nos sirve para representar un partido dentro de la aplicación
// aqui guardaremos toda la informacion que viene de la API
class Partido {
  //esto representan los campos que vienen desde postgres
  final int idPartido;
  final String equipo1;
  final String equipo2;
  int golesE1;
  int golesE2;
  final String fecha;

  // constructor del objeto Partido, sirve para crear objetos
  // required obliga a que todos estos valores sean enviados al crear el objeto
  Partido({
    required this.idPartido,
    required this.equipo1,
    required this.equipo2,
    required this.golesE1,
    required this.golesE2,
    required this.fecha,
  });

  // este factory nos sirve para convertir el json que viene de la API
  // en un objeto Partido que Flutter pueda utilizar facilmente
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      idPartido: json['id_partido'],
      equipo1: json['equipo1'],
      equipo2: json['equipo2'],
      golesE1: json['goles_e1'] ?? 0,
      golesE2: json['goles_e2'] ?? 0,
      fecha: json['fecha'].toString(),
    );
  }
}
