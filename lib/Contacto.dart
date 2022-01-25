// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color_interfaz = Color(0xffb4c2dd);
  int _counter = 0;
  late List<Map> listaContactos;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      //appBar: AppBar(),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //En este primer container va la cabecera de la página
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.all(25),
              height: 100,
              width: 380,
              child: const Text(
                "Contactos",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 50),
              ),
              decoration: BoxDecoration(
                  color: color_interfaz,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),

            //En el segundo container la idea es poner una list view con todos los contactos
            Container(
              /**
               * Como usar la clase container: Flutter Docs
               * https://api.flutter.dev/flutter/widgets/Container-class.html
               */
              margin: const EdgeInsets.only(top: 5.0, bottom: 0.0),
              padding: const EdgeInsets.all(25),
              height: 610,
              width: 380,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15)),
              //Aqui en el child deben ir los contactos xd
              child: FlutterLogo(),
            )

            /*
            Positioned(
                top: 1000,
                child:),
                */
            /*
          const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            */
          ],
        ),
      ),

      //Finalmente el bottomNavigationBar que supongo que repetiremos
      //en todas las pantallas

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color_interfaz,
        elevation: 4,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 40),

        /**
         * Como hacer un bottom navigation bar tomado de:
         * https://blog.logrocket.com/how-to-build-a-bottom-navigation-bar-in-flutter/#:~:text=BottomNavigationBar%20is%20a%20widget%20that,navigate%20to%20a%20given%20page.
         */
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: Colors.black,
                  size: 30.0,
                  semanticLabel: 'Persona en recuadro'),
              label: "Yo"),
          BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts,
                  color: Colors.black,
                  size: 30.0,
                  semanticLabel: 'Lista de contactos'),
              label: "Contactos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add,
                  color: Colors.black,
                  size: 30.0,
                  semanticLabel: 'Añadir a contacto'),
              label: "Añadir"),
        ],
      ),

      //Pendiente ponerle interactividad xdd
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
