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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Hola, Kevin'),
                Text('Julio 2026'),
              ],
            ),
            const SizedBox(height: 22),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'TE QUEDAN DISPONIBLES',
                  style: TextStyle(fontSize: 11),
                ),
                SizedBox(height: 6),
                Text(
                  'Q2,796.50',
                  style: TextStyle(fontSize: 52),
                ),
                SizedBox(height: 16),
                LinearProgressIndicator(value: 0.57),
                SizedBox(height: 7),
                Text(
                  'Has usado Q3,703.50 de Q6,500.00',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 202, 133, 252),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Cuentas',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Q7,810.00',
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 202, 133, 252),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Metas de ahorro',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '3 activas',
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Row(
              children: const [
                Text(
                  'Últimos movimientos',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Text(
                  'Ver todo',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),

            filaMovimiento(
              Icons.directions_bus,
              'Uber al trabajo',
              'Transporte · Tarjeta',
              '− Q38.00',
              'Hoy',
            ),

            filaMovimiento(
              Icons.shopping_cart,
              'Súper La Torre',
              'Súper y comida · Tarjeta',
              '− Q285.50',
              'Ayer',
            ),

            filaMovimiento(
              Icons.arrow_upward,
              'Salario quincena',
              'Ingreso · Banco',
              '+ Q4,200.00',
              'Ayer',
            ),

            filaMovimiento(
              Icons.local_cafe,
              'Café con Ana',
              'Entretenimiento · Efectivo',
              '− Q65.00',
              'Ayer',
            ),

            filaMovimiento(
              Icons.bolt,
              'Recibo de luz (EEGSA)',
              'Servicios · Banco',
              '− Q420.00',
              'Lun 20',
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 138, 83, 235),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Cuentas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reportes',
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

Widget filaMovimiento(
  IconData icon,
  String title,
  String subtitle,
  String amount,
  String date,
) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(amount),
        Text(date),
      ],
    ),
  );
}