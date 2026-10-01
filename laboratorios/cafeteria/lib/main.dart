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
 title: 'Cafetería',
 theme: ThemeData(colorSchemeSeed: Colors.brown, useMaterial3: true),
 home: const MiPedido(),
 );
 }
}


class ProductoPedido extends StatelessWidget {
 final String nombre;
 final double precio;
 final int cantidad;
 final VoidCallback onRestar;
 final VoidCallback onSumar;

 const ProductoPedido({
 super.key,
 required this.nombre,
 required this.precio,
 required this.cantidad,
 required this.onRestar,
 required this.onSumar,
 });

 @override
 Widget build(BuildContext context) {
 return Padding(
 padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
 child: Row(
 children: [
 
 Expanded(
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text(
 nombre,
 style: const TextStyle(
 fontSize: 18, fontWeight: FontWeight.bold),
 ),
 const SizedBox(height: 4),
 Text('Q${precio.toStringAsFixed(2)}'),
 ],
 ),
 ),
 // Controles - cantidad +
 IconButton(
 onPressed: onRestar,
 icon: const Icon(Icons.remove_circle_outline),
 ),
 SizedBox(
 width: 32,
 child: Text(
 '$cantidad',
 textAlign: TextAlign.center,
 style: const TextStyle(fontSize: 18),
 ),
 ),
 IconButton(
 onPressed: onSumar,
 icon: const Icon(Icons.add_circle_outline),
 ),
 ],
 ),
 );
 }
}

//Pantalla principal
class MiPedido extends StatefulWidget {
 const MiPedido({super.key});

 @override
 State<MiPedido> createState() => _MiPedidoState();
}

class _MiPedidoState extends State<MiPedido> {
 // Precios
 static const double precioCafe = 10.00;
 static const double precioSandwich = 25.00;
 static const double precioJugo = 12.00;

 // Cantidades (inician en cero)
 int cafe = 0;
 int sandwich = 0;
 int jugo = 0;

 // Total = suma de precio × cantidad
 double get total =>
 cafe * precioCafe + sandwich * precioSandwich + jugo * precioJugo;

 void vaciarPedido() {
 setState(() {
 cafe = 0;
 sandwich = 0;
 jugo = 0;
 });
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: const Text('Mi pedido'), centerTitle: true),
 body: Column(
 children: [
 ProductoPedido(
 nombre: 'Café',
 precio: precioCafe,
 cantidad: cafe,
 onRestar: () {
 if (cafe > 0) setState(() => cafe--);
 },
 onSumar: () => setState(() => cafe++),
 ),
 const Divider(),
 ProductoPedido(
 nombre: 'Sándwich',
 precio: precioSandwich,
 cantidad: sandwich,
 onRestar: () {
 if (sandwich > 0) setState(() => sandwich--);
 },
 onSumar: () => setState(() => sandwich++),
 ),
 const Divider(),
 ProductoPedido(
 nombre: 'Jugo',
 precio: precioJugo,
 cantidad: jugo,
 onRestar: () {
 if (jugo > 0) setState(() => jugo--);
 },
 onSumar: () => setState(() => jugo++),
 ),
 const Divider(),
 const Spacer(), // empuja el total y el botón hacia abajo
 Padding(
 padding: const EdgeInsets.all(16),
 child: Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: [
 const Text('Total',
 style:
 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
 Text(
 'Q${total.toStringAsFixed(2)}',
 style: const TextStyle(
 fontSize: 22, fontWeight: FontWeight.bold),
 ),
 ],
 ),
 ),
 Padding(
 padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
 child: SizedBox(
 width: double.infinity,
 height: 50,
 child: FilledButton(
 onPressed: vaciarPedido,
 child: const Text('Vaciar pedido'),
 ),
 ),
 ),
 ],
 ),
 );
 }
}