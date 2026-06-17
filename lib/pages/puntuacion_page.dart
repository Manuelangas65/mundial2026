import 'package:flutter/material.dart';

import '../models/partido.dart';
import '../services/api_service.dart';

class PuntuacionPage extends StatefulWidget {
  final Partido partido;

  const PuntuacionPage({super.key, required this.partido});

  @override
  State<PuntuacionPage> createState() => _PuntuacionPageState();
}

class _PuntuacionPageState extends State<PuntuacionPage> {
  late int golesE1;
  late int golesE2;

  @override
  void initState() {
    super.initState();

    golesE1 = widget.partido.golesE1;
    golesE2 = widget.partido.golesE2;
  }

  Future<void> guardar() async {
    try {
      await ApiService.actualizarMarcador(
        idPartido: widget.partido.idPartido,
        golesE1: golesE1,
        golesE2: golesE2,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Marcador guardado")));

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Widget botonSumar(VoidCallback accion) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: Colors.green,
      child: IconButton(
        onPressed: accion,
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget botonRestar(VoidCallback accion) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: Colors.red,
      child: IconButton(
        onPressed: accion,
        icon: const Icon(Icons.remove, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                const SizedBox(height: 10),

                const Text(
                  "Puntuación",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.partido.equipo1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              botonRestar(() {
                                if (golesE1 > 0) {
                                  setState(() {
                                    golesE1--;
                                  });
                                }
                              }),

                              const SizedBox(width: 10),

                              botonSumar(() {
                                setState(() {
                                  golesE1++;
                                });
                              }),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Text(
                            golesE1.toString(),
                            style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.partido.equipo2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              botonRestar(() {
                                if (golesE2 > 0) {
                                  setState(() {
                                    golesE2--;
                                  });
                                }
                              }),

                              const SizedBox(width: 10),

                              botonSumar(() {
                                setState(() {
                                  golesE2++;
                                });
                              }),
                            ],
                          ),

                          const SizedBox(height: 15),

                          Text(
                            golesE2.toString(),
                            style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color(0xFFC4F0D4),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    children: [
                      Text(
                        "${widget.partido.equipo1}  $golesE1 - $golesE2  ${widget.partido.equipo2}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: 240,
                  height: 65,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7989E8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    onPressed: guardar,

                    child: const Text(
                      "GUARDAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
