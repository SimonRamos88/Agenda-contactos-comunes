import 'package:flutter/material.dart';
import 'package:agenda/widget/appbar_widget.dart';
import 'package:agenda/widget/profile_widget.dart';
import 'package:agenda/widget/button._widget.dart';
import 'package:agenda/modelo/Contacto.dart';
import 'package:agenda/pages/Perfil/pantalla_editar.dart';

class PaginaPerfil extends StatefulWidget {
  @override
  _PerfilEstado createState() => _PerfilEstado();
}

class _PerfilEstado extends State<PaginaPerfil> {
  final contacto = Contacto(
    "Juan Simon",
    312341341,
    12341234214,
    "Claro",
    "hola@hotmail.com",
    "https://www.asofiduciarias.org.co/wp-content/uploads/2018/06/sin-foto.png",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: contacto.linkFoto,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          construirNombre(contacto),
          const SizedBox(height: 24),
          Center(child: editarContacto()),
          const SizedBox(height: 24),
          construirInformacion(contacto),
        ],
      ),
    );
  }

  Widget construirNombre(Contacto contacto) => Column(
        children: [
          Text(
            contacto.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            contacto.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget editarContacto() => ButtonWidget(
      text: "Editar",
      onClicked: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditarPerfil()),
        );
      });

  Widget construirInformacion(Contacto contacto) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Telefono 1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            contacto.telefono1.toString(),
            style: const TextStyle(
              height: 1.4,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Telefono 2",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            contacto.telefono2.toString(),
            style: const TextStyle(
              height: 1.4,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Compañia",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            contacto.compania,
            style: const TextStyle(
              height: 1.4,
              fontSize: 16,
            ),
          ),
        ],
      );
}
