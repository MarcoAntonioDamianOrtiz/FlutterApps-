import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  TextEditingController counterText = TextEditingController();
  int counter = 0;
  final estiiloTexto =
      const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de click'),
      ),
      body: Center(
        child: contenido(),
      ),
      floatingActionButton: botones(counter),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void incrementar() {
    counter++;
    counterText.text = counter.toString();
    setState(() {});
  }

  void decrementar() {
    counter--;
    counterText.text = counter.toString();
    setState(() {});
  }

  void reiniciar() {
    counter = 0;
    counterText.text = counter.toString();
    setState(() {});
  }

  Column contenido() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        espacio(15.5),
        Text('Taps: '),
        Text('Numero de taps: ', style: estiiloTexto),
        espacio(50.0),
        conteo(),
        espacio(50.0),
        Text(
          'Desarrollador: ',
          style: estiiloTexto,
        ),
        Text(
          'Marco Antonio',
          style: estiiloTexto,
        ),
        espacio(50),
      ],
    );
  }

  SizedBox conteo() {
    return SizedBox(
      width: 250.0,
      child: TextField(
        onChanged: (value) {
          counter = int.parse(value);
        },
        enabled: true,
        controller: counterText,
        style: const TextStyle(
          color: Color.fromARGB(200, 200, 25, 0),
          fontWeight: FontWeight.bold,
        ),
        maxLength: 5,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Taps',
          hintText: 'Escribe el valor inicial del contador: ',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.green,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8 - 0)),
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 6.0,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox espacio(double alto) {
    return SizedBox(height: alto);
  }

  Row botones(int counter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: decrementar,
          foregroundColor: Colors.amber,
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          onPressed: reiniciar,
          foregroundColor: Colors.amber,
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          onPressed: incrementar,
          foregroundColor: Colors.amber,
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.exposure_plus_1),
        ),
      ],
    );
  }
}
