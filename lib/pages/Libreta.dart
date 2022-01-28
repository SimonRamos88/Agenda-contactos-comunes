// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../modelo/Contacto.dart';
import 'package:agenda/Logica/Metodos.dart';

//import 'package:agenda/Pantallas/Perfil/pantalla_perfil.dart';
import '../main.dart';

class MenuContactos extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  State<MenuContactos> createState() => _MenuContactosState();
}

class _MenuContactosState extends State<MenuContactos> {
  Color color_interfaz = Color(0xffb4c2dd);

  List<Contacto> _contactos = Metodos.contactos;

  void irAContacto(Contacto c) {
    //este metodo deberia tener el parametro Contacto y un navigator xd
    setState(() {
      Metodos.contactoActual = c;
      Navigator.pushNamed(context, "/Ver");
    });
  }

  void cambiarPantalla(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.pushNamed(context, "/");
        break;
      case 1:
        Navigator.pushNamed(context, "/Crear");
        break;
    }
  }

  void _mostrarAjustes(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            //mirar si dejamos este o el alertDialog de material
            title: Text("Opciones de la aplicación"),
            content: Text("Selecciona una de las opciones por favor: "),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  color: color_interfaz,
                  child: Text("Exportar Contactos")),
              FlatButton(
                  color: color_interfaz,
                  onPressed: () => Navigator.pop(context),
                  child: Text("Importar Contactos")),
              FlatButton(
                  color: color_interfaz,
                  onPressed: () => Navigator.pop(context),
                  child: Text("Volver")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      //appBar: AppBar(),
      appBar: AppBar(title: Text('Contactos ${_contactos.length}')),

      // actions: <Widget>
      // ],

      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //En este primer container va la cabecera de la página
            /*
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.all(25),
              height: 100,
              width: 380,
              child: Text(
                "Contactos ${_contactos.length}",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 50),
              ),
              decoration: BoxDecoration(
                  color: color_interfaz,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
            */

            //En el segundo container la idea es poner una list view con todos los contactos
            Container(
              /**
               * Como usar la clase container: Flutter Docs
               * https://api.flutter.dev/flutter/widgets/Container-class.html
               */
              margin: const EdgeInsets.only(top: 4.0, bottom: 0.0),
              padding: const EdgeInsets.all(25),
              height: 550,
              width: 380,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15)),
              //Aqui en el child deben ir los contactos xd
              child: ListView(
                //cambia la direccion de scroll
                scrollDirection: Axis.vertical,
                children:
                    //cada container es un contacto, ahora la pregunta es
                    //como creo un widget por contacto xdd
                    //La respuesta está en este list.generate
                    // DOC: https://docs.flutter.dev/cookbook/lists/grid-lists
                    List.generate(_contactos.length, (index) {
                  return 
                  Container(
                    height: 80,
                    width: 500,
                    decoration: BoxDecoration(
                        color: color_interfaz,
                        border:
                            Border.all(width: 2, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(2)),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        //container de la imagen
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            //borderRadius: BorderRadius.circular(5)),
                            //margin: EdgeInsets.only(left: 20),
                            child: Ink.image(
                              image: NetworkImage(_contactos[index].linkFoto),
                              width: 60, 
                              height: 60, 
                              fit: BoxFit.cover
                              ),
                        ),
                        ),
                        //container del texto
                        Container(
                            margin: EdgeInsets.only(left: 25, top:25),
                            child:
                                // ignore: prefer_const_constructors
                                InkWell(
                                    onTap: () => irAContacto(_contactos[index]),
                                    child: Text(
                                      "${_contactos[index].nombre}",
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                      textAlign: TextAlign.left,
                                    ))),
                      ],
                  ));
                }),
              ),
              /*
              Imagen de prueba ke no kunda el panico
              Image.network(
                "https://pbs.twimg.com/ext_tw_video_thumb/1403401316681097220/pu/img/7dt7pn3SgtUvWVKS.jpg",
                width: 200,
                height: 300,
                fit: BoxFit.fill,
                
              ),
              */
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
          /*
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: Colors.black,
                  size: 30.0,
                  semanticLabel: 'Persona en recuadro'),
              label: "Yo"),
*/
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
        onTap: cambiarPantalla,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      //Pendiente ponerle interactividad xdd
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarAjustes(context),
        tooltip: 'Increment',
        child: const Icon(Icons.build_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
