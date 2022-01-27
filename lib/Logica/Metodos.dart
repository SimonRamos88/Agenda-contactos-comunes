// ignore: file_names
// ignore: file_names
// ignore_for_file: non_constant_identifier_names, file_names

import '../modelo/Contacto.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class AlmacenamientoAndroid {
  //Creamos  la clase
  //Este metodo futuro nos trae el path de la carpeta documentos
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

//con el path, creamos el archivo deseado
  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/contactos.txt");
  }

  //Ahora lo leemos
  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      //Leemos el archivo como una String XDD
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

//terminar de buscar para guardar datos en andrir
  Future<File> writeCounter(String datos) async {
    final file = await _localFile;

    return file.writeAsString(datos);
  }
}

class Metodos {
  static late Contacto ContactoActual;
  static List<Contacto> contactos = [
    Contacto(
      "Juan Cortes",
      312341341,
      12341234214,
      "Claro",
      "Juan@hotmail.com",
      "https://www.asofiduciarias.org.co/wp-content/uploads/2018/06/sin-foto.png",
    ),
    Contacto(
      "Simon Ramos",
      24523523,
      45234524,
      "Tigo",
      "Simon@hotmail.com",
      "https://www.asofiduciarias.org.co/wp-content/uploads/2018/06/sin-foto.png",
    ),
    Contacto(
      "Pecha Rodriguez",
      41434903240,
      4624523134,
      "Wom",
      "Pecha@hotmail.com",
      "https://www.asofiduciarias.org.co/wp-content/uploads/2018/06/sin-foto.png",
    ),
    Contacto(
      "Jefferson Ramirez",
      2094580485,
      545134525,
      "Claro",
      "Jeff@hotmail.com",
      "https://www.asofiduciarias.org.co/wp-content/uploads/2018/06/sin-foto.png",
    ),
  ];

  static void eliminarContacto(Contacto borrar) {
    /*
      listaContactos.forEach((element) {
        if (element == borrar) {
          listaContactos.remove(element);
        }
      });
      Testear estos metodos mañana xd
      */
  }

  static dynamic agregarContacto() {
    // _contactos.add(agregar);
  }

//aqui en editar contacto lo que hacemos es modificar el contacto, sacarlo de la lista y
//meterlo de nuevo XDDD
  static void EditarContacto(String nombreCompleto, String email, int telefono1,
      int telefono2, String compania, Contacto editable) {
    editable.Nombre = nombreCompleto;
    editable.Compania = compania;
    editable.telefono1 = telefono1;
    editable.telefono2 = telefono2;
    editable.email = email;
    ContactoActual = editable;
    contactos.remove(editable);
    contactos.add(editable);
  }
}
