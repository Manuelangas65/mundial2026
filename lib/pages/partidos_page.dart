import 'package:flutter/material.dart';

import '../models/partido.dart';
import '../services/api_service.dart';
import '../widgets/partido_card.dart';
import 'puntuacion_page.dart';

class PartidosPage extends StatefulWidget {

  const PartidosPage({
    super.key,
  });

  @override
  State<PartidosPage> createState() =>
      _PartidosPageState();
}

class _PartidosPageState
    extends State<PartidosPage> {

  late Future<List<Partido>>
      futurosPartidos;

  @override
  void initState() {
    super.initState();

    cargarPartidos();
  }

  void cargarPartidos() {

    futurosPartidos =
        ApiService.obtenerPartidos();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Partidos",
        ),
      ),

      body: FutureBuilder<List<Partido>>(

        future: futurosPartidos,

        builder: (
          context,
          snapshot,
        ) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final partidos =
              snapshot.data ?? [];

          return RefreshIndicator(

            onRefresh: () async {

              setState(() {

                cargarPartidos();

              });

            },

            child: ListView.builder(

              itemCount:
                  partidos.length,

              itemBuilder:
                  (context, index) {

                final partido =
                    partidos[index];

                return PartidoCard(

                  partido: partido,

                  onTap: () async {

                    await Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            PuntuacionPage(
                          partido:
                              partido,
                        ),

                      ),

                    );

                    setState(() {

                      cargarPartidos();

                    });

                  },

                );
              },

            ),

          );
        },

      ),

    );
  }
}