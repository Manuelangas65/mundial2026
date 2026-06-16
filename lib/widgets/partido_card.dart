import 'package:flutter/material.dart';
import '../models/partido.dart';

class PartidoCard extends StatelessWidget {
  final Partido partido;
  final VoidCallback onTap;

  const PartidoCard({
    super.key,
    required this.partido,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.sports_soccer,
          size: 35,
        ),
        title: Text(
          "${partido.equipoLocal} vs ${partido.equipoVisitante}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "${partido.golesLocal} - ${partido.golesVisitante}",
        ),
        trailing: const Icon(Icons.edit),
        onTap: onTap,
      ),
    );
  }
}