
import '../modelo/Contacto.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';


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

  static late Contacto contactoActual;

  static void eliminarContacto(Contacto borrar) {
    for (var i = contactos.length - 1; i >= 0; i--) {
      if (contactos[i] == borrar) {
        contactos.remove(contactos[i]);
      }
    }
  }

  static void CrearContacto(String nombre, int tef1, int tef2, String comp, String email, String linkfoto) {

    Contacto nuevo = Contacto(nombre, tef1, tef2, comp, email, linkfoto);
    contactos.add(nuevo);
    print(nuevo.Nombre);
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
