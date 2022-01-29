import 'package:agenda/camara.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'pages/Libreta.dart';
import 'pages/crear_contacto.dart';
import 'pages/Perfil/pantalla_editar.dart';
import 'pages/Perfil/pantalla_perfil.dart';
import 'package:agenda/modelo/Persistencia.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => MenuContactos(),
          "/Crear": (BuildContext context) => PrincipalPage(),
          "/Editar": (BuildContext context) => EditarPerfil(),
          "/Ver": (BuildContext context) => PaginaPerfil()
        }

        //home: MenuContactos(),
        );
  }
}
