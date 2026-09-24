import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcador',
      debugShowCheckedModeBanner: false,
      home: const MarcadorScreen(),
    );
  }
}

class MarcadorScreen extends StatefulWidget {
  const MarcadorScreen({super.key});

  @override
  State<MarcadorScreen> createState() => _MarcadorScreenState();
}

class _MarcadorScreenState extends State<MarcadorScreen> {
  final String nombreA = 'Equipo A';
  final String nombreB = 'Equipo B';

  int puntosA = 0;
  int puntosB = 0;

  // Colores
  final Color colorNeutro = Colors.grey.shade200;
  final Color colorGanador = Colors.green.shade300;

  void incrementarA() {
    setState(() {
      puntosA++;
    });
  }

  void decrementarA() {
    setState(() {
      if (puntosA > 0) puntosA--;
    });
  }

  void incrementarB() {
    setState(() {
      puntosB++;
    });
  }

  void decrementarB() {
    setState(() {
      if (puntosB > 0) puntosB--;
    });
  }

  void reiniciar() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
    });
  }

  String get mensaje {
    if (puntosA == puntosB) return 'Empate';
    if (puntosA > puntosB) return 'Va ganando $nombreA';
    return 'Va ganando $nombreB';
  }

  Color get colorA {
    if (puntosA == puntosB) return colorNeutro;
    return puntosA > puntosB ? colorGanador : colorNeutro;
  }

  Color get colorB {
    if (puntosA == puntosB) return colorNeutro;
    return puntosB > puntosA ? colorGanador : colorNeutro;
  }

  Widget _tarjetaEquipo({
    required String nombre,
    required int puntos,
    required Color color,
    required VoidCallback onSumar,
    required VoidCallback onRestar,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              nombre,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '$puntos',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onRestar,
                  child: const Text('-1'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: onSumar,
                  child: const Text('+1'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  _tarjetaEquipo(
                    nombre: nombreA,
                    puntos: puntosA,
                    color: colorA,
                    onSumar: incrementarA,
                    onRestar: decrementarA,
                  ),
                  _tarjetaEquipo(
                    nombre: nombreB,
                    puntos: puntosB,
                    color: colorB,
                    onSumar: incrementarB,
                    onRestar: decrementarB,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                mensaje,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: reiniciar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Reiniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}