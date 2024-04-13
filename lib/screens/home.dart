import 'package:flutter/material.dart';
import 'package:app8/models/pais.dart';

class HomeScreen extends StatefulWidget {
  final String titulo;

  const HomeScreen({
    super.key,
    required this.titulo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Pais> paises = [
    Pais(pais: 'Venezuela', capital: 'Caracas', poblacion: '28M'),
    Pais(pais: 'Perú', capital: 'Lima', poblacion: '34M'),
    Pais(pais: 'Colombia', capital: 'Bogota', poblacion: '52M'),
    Pais(pais: 'Argentina', capital: 'Buenos aires', poblacion: '46M'),
    Pais(pais: 'Uruguay', capital: 'Montevideo', poblacion: '3M'),
    Pais(pais: 'Brasil', capital: 'Brasilia', poblacion: '208M'),
    Pais(pais: 'Paraguay', capital: 'La Asunción', poblacion: '6M'),
    Pais(pais: 'Ecuador', capital: 'Quito', poblacion: '18M'),
    Pais(pais: 'Chile', capital: 'Santiago', poblacion: '19M'),
    Pais(pais: 'Bolivia', capital: 'La Paz', poblacion: '12M'),
  ];

  @override
  Widget build(BuildContext context) {
    paises.sort(
      (a, b) => a.pais.compareTo(b.pais),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: paises.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onLongPress: () {
                //debugPrint(paises[index].pais);
                borrarPais(paises[index]);
              },
              leading: CircleAvatar(
                child: Text(paises[index].pais.substring(0, 2)),
              ),
              title: Text(paises[index].pais),
              subtitle: Text(paises[index].capital),
              trailing: Text(paises[index].poblacion),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  void borrarPais(Pais data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Borrar país'),
        content: Text('¿Desea borrar el país ${data.pais}?'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel),
            label: Text('Cancelar'),
          ),
          TextButton.icon(
            onPressed: () {
              //debugPrint(data.pais);
              paises.remove(data);
              setState(() {});
              Navigator.pop(context);
            },
            icon: Icon(Icons.check_circle),
            label: Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}
