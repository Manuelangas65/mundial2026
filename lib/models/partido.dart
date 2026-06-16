class Partido {
  final int id;
  final String equipoLocal;
  final String equipoVisitante;
  int golesLocal;
  int golesVisitante;

  Partido({
    required this.id,
    required this.equipoLocal,
    required this.equipoVisitante,
    this.golesLocal = 0,
    this.golesVisitante = 0,
  });
}