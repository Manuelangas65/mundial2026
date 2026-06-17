import 'package:flutter/material.dart';

import '../models/partido.dart';

class PartidoCard
    extends StatelessWidget {

  final Partido partido;
  final VoidCallback onTap;

  const PartidoCard({
    super.key,
    required this.partido,
    required this.onTap,
  });

  @override
  Widget build(
      BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin:
            const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),

        padding:
            const EdgeInsets.all(18),

        decoration:
            BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
            20,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ],
        ),

        child: Column(

          children: [

            Text(
              "${partido.equipo1} vs ${partido.equipo2}",
              style:
                  const TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              "${partido.golesE1} - ${partido.golesE2}",
              style:
                  const TextStyle(
                fontSize: 32,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            const Text(
              "Tocar para editar",
              style: TextStyle(
                color:
                    Colors.grey,
              ),
            ),

          ],

        ),

      ),

    );
  }
}