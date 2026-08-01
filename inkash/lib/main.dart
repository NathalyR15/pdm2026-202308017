import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkash',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Hola, Kevin'), Text('Julio 2026')],
              ),
              const SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('TE QUEDAN DISPONIBLES', style: TextStyle(fontSize: 11)),
                  SizedBox(height: 6),
                  Text('Q2,796.50', style: TextStyle(fontSize: 52)),
                  SizedBox(height: 16),
                  LinearProgressIndicator(value: 0.57),
                  SizedBox(height: 7),
                  Text(
                    'Has usado Q3,703.50 de Q6,500.00',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: const Color.fromARGB(255, 152, 113, 209),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Cuentas', style: TextStyle(fontSize: 12)),
                            SizedBox(height: 8),
                            Text(
                              'Q90.00',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Card(
                      color: const Color.fromARGB(255, 152, 113, 209),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Resto del mes', style: TextStyle(fontSize: 12)),
                            SizedBox(height: 8),
                            Text(
                              'Q2,706.50',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Últimos movimientos',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ver todo',
                    style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _MovimientoItem(
                titulo: 'Gastos de Ubes',
                monto: '- Q50.00',
              ),
              const Divider(),
              _MovimientoItem(
                titulo: 'Lista de la torre',
                monto: '- Q120.00',
              ),
              const Divider(),
              _MovimientoItem(
                titulo: 'Supermercado',
                monto: '- Q315.75',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovimientoItem extends StatelessWidget {
  const _MovimientoItem({required this.titulo, required this.monto});

  final String titulo;
  final String monto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: const TextStyle(fontSize: 14)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                monto,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Text(
                'VER DETALLE',
                style: TextStyle(fontSize: 10, color: Colors.deepPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}