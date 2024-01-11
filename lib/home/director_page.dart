import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlankPage(),
    );
  }
}

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OptionsPage(),
              ),
            );
          },
          child: Text('Go to Options Page'),
        ),
      ),
    );
  }
}

class OptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateToSubOptions(context, 'Añadir');
              },
              child: Text('Añadir'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToSubOptions(context, 'Eliminar');
              },
              child: Text('Eliminar'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToSubOptions(context, 'Editar');
              },
              child: Text('Editar'),
            ),
            ElevatedButton(
              onPressed: () {
                _navigateToSubOptions(context, 'Ver');
              },
              child: Text('Ver'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSubOptions(BuildContext context, String option) {
    pushNewScreen(
      context,
      screen: SubOptionsPage(option),
      withNavBar: false,
    );
  }
  
  void pushNewScreen(BuildContext context, {required SubOptionsPage screen, required bool withNavBar}) {}
}

class SubOptionsPage extends StatelessWidget {
  final String option;

  SubOptionsPage(this.option);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$option Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implementar la lógica para la opción específica
                print('Presionaste Añadir en la página $option');
              },
              child: Text('Añadir $option'),
            ),
            // Agregar botones adicionales según sea necesario
          ],
        ),
      ),
    );
  }
}
