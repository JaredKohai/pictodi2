import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PsicologoPage extends StatelessWidget {
  final String nombre;
  const PsicologoPage({Key? key, required this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido, $nombre'),
      ),
      body: const Center(
        child: Text('Bienvenido, Psicologo'),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Inicio'),
          TabItem(icon: Icons.search, title: 'Pictogramas'),
          TabItem(icon: Icons.assignment, title: 'Actividades'),
          TabItem(icon: Icons.account_circle_outlined, title: 'Cuenta'),
          // TODO: Agrega más elementos según sea necesario
          // Ejemplo:
          // TabItem(icon: Icons.notifications, title: 'Notificaciones'),
          // TabItem(icon: Icons.settings, title: 'Configuración'),
        ],
        onTap: (index) {
          // Maneja la acción cuando se toca un ítem
          // Puedes agregar lógica adicional aquí según el índice seleccionado
        },
      ),
    );
  }
}
