import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../modelo/Contacto.dart';

class Metodos {
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

  static late Contacto contactoActual;

  static void eliminarContacto(Contacto borrar) {
    for (var i = contactos.length - 1; i >= 0; i--) {
      if (contactos[i] == borrar) {
        contactos.remove(contactos[i]);
      }
    }
  }

  static void agregarContacto(Contacto agregar) {
    // _contactos.add(agregar);
  }

  static void EditarContacto(Contacto editable) {
    //Terminar este metodo mañana
  }
}
