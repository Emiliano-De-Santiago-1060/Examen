import 'package:flutter/material.dart';

// Definir la clase Cliente
class Cliente {
  String id;
  String nombre;
  String direccion;
  String telefono;
  String fechadenacimiento;
  String correo;

  // Constructor
  Cliente({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.fechadenacimiento,
    required this.correo,
  });

  // Método para convertir el cliente en un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'fechadenacimiento': fechadenacimiento,
      'correo': correo,
    };
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de clientes con mapas de información
    List<Map<String, String>> clientes = [
      {
        'id': '1',
        'nombre': 'Juan Pérez',
        'direccion': 'Av. Siempre Viva 123',
        'telefono': '555-1234',
        'fechadenacimiento': '10/05/1990',
        'correo': 'juan@example.com',
      },
      {
        'id': '2',
        'nombre': 'Ana Gómez',
        'direccion': 'Calle Luna 45',
        'telefono': '555-5678',
        'fechadenacimiento': '22/08/1985',
        'correo': 'ana@example.com',
      },
    ];

    // Convertir los mapas en objetos de la clase Cliente
    List<Cliente> clientesList = clientes
        .map((cliente) => Cliente(
              id: cliente['id']!,
              nombre: cliente['nombre']!,
              direccion: cliente['direccion']!,
              telefono: cliente['telefono']!,
              fechadenacimiento: cliente['fechadenacimiento']!,
              correo: cliente['correo']!,
            ))
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quitar banner de depuración
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clientes - Emiliano de Santiago Soto, 22308051281060'),
          backgroundColor: Color(0xFF3C8000),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: clientesList.map((cliente) {
                return Column(
                  children: [
                    Card(
                      color: Colors.blueAccent,
                      margin: EdgeInsets.all(8),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: ${cliente.id}', style: TextStyle(color: Colors.white)),
                            Text('Nombre: ${cliente.nombre}', style: TextStyle(color: Colors.white)),
                            Text('📍 ${cliente.direccion}', style: TextStyle(color: Colors.white)),
                            Text('📞 ${cliente.telefono}', style: TextStyle(color: Colors.white)),
                            Text('🎂 ${cliente.fechadenacimiento}', style: TextStyle(color: Colors.white)),
                            Text('✉️ ${cliente.correo}', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Colors.black45, thickness: 1),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
