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
      title: 'ParkTime',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: const ParqueosDisponiblesPage(),
    );
  }
}

class ParqueosDisponiblesPage extends StatefulWidget {
  const ParqueosDisponiblesPage({super.key});

  @override
  State<ParqueosDisponiblesPage> createState() =>
      _ParqueosDisponiblesPageState();
}

class _ParqueosDisponiblesPageState extends State<ParqueosDisponiblesPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Lista de parqueos de ejemplo (esto luego se puede conectar a datos reales)
  final List<Map<String, String>> parqueos = const [
    {
      'nombre': 'Parqueo Zona 1',
      'estado': 'Disponible',
      'direccion': '5ta Avenida 3-45',
    },
    {
      'nombre': 'Parqueo Plaza Norte',
      'estado': 'Disponible',
      'direccion': '2da Calle 8-12',
    },
    {
      'nombre': 'Parqueo Central',
      'estado': 'Disponible',
      'direccion': '4ta Avenida 1-20',
    },
    {
      'nombre': 'Parqueo El Trebol',
      'estado': 'Disponible',
      'direccion': '6ta Calle 5-33',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Parqueos disponibles',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'cerca de tu trabajo',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 22),

            // Genera una tarjeta por cada parqueo de la lista
            for (final parqueo in parqueos)
              tarjetaParqueo(
                context,
                nombre: parqueo['nombre']!,
                estado: parqueo['estado']!,
                direccion: parqueo['direccion']!,
              ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Parqueos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Ruta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// Widget reutilizable para cada tarjeta de parqueo (como filaMovimiento del ejemplo)
Widget tarjetaParqueo(
  BuildContext context, {
  required String nombre,
  required String estado,
  required String direccion,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1.5),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        const Icon(Icons.local_parking, size: 32),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                direccion,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    'Estado: ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    estado,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            // Aquí luego se navega a la pantalla del mapa con la ubicación
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ver ubicación: $nombre')),
            );
          },
          child: const Text('Ver ubicación', style: TextStyle(fontSize: 12)),
        ),
      ],
    ),
  );
}
