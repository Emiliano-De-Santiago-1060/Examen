import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ClientesScreen());
  }
}

class ClientesScreen extends StatelessWidget {
  final clientes = [
    {'id': '1', 'nombre': 'Juan Pérez', 'direccion': 'Av. Siempre Viva 123', 'telefono': '555-1234', 'fechadenacimiento': '10/05/1990', 'correo': 'juan@example.com'},
    {'id': '2', 'nombre': 'Ana Gómez', 'direccion': 'Calle Luna 45', 'telefono': '555-5678', 'fechadenacimiento': '22/08/1985', 'correo': 'ana@example.com'},
  ];
  final colores = [Color(0xFF00A878), Color(0xFF00BFFF)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clientes - Emiliano de Santiago Soto, 22308051281060'), backgroundColor: Color(0xFF3C8000)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(clientes.length, (index) {
              final cliente = clientes[index];
              return Card(
                color: colores[index % colores.length],
                margin: EdgeInsets.all(8),
                elevation: 8, // Añadir sombra
                shadowColor: Colors.black.withOpacity(0.5), // Color de la sombra
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${cliente['id']}', style: TextStyle(color: Colors.white)), // Atributo id en una sola línea
                      Text(cliente['nombre']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ...[
                        '📍 ${cliente['direccion']}',
                        '📞 ${cliente['telefono']}',
                        '🎂 ${cliente['fechadenacimiento']}',
                        '✉️ ${cliente['correo']}',
                      ].map((text) => Text(text, style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
