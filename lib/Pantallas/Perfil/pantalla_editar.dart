import 'package:flutter/material.dart';
import 'package:agenda/widget/appbar_widget.dart';
import 'package:agenda/widget/profile_widget.dart';
import 'package:agenda/widget/button._widget.dart';
import 'package:agenda/pruebas/pruebasContactos.dart';
import 'package:agenda/modelo/Contacto.dart';
import 'package:agenda/widget/textField_widget.dart';
import 'package:agenda/widget/button._widget.dart';
import 'package:agenda/Pantallas/Perfil/pantalla_perfil.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilEstado createState() => _EditarPerfilEstado();
}

class _EditarPerfilEstado extends State<EditarPerfil> {
  final contacto = PreferenciasUsuario.contacto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: contacto.linkFoto,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Nombre completo",
              text: contacto.nombre,
              onChanged: (nombre) {},
              ),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Email",
              text: contacto.email,
              onChanged: (email) {},
              ),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Telefono 1",
              text: contacto.telefono1,
              onChanged: (telefono1) {},
              ),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Telefono 2",
              text: contacto.telefono2,
              onChanged: (telefono2) {},
              ),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "Compañia",
              text: contacto.compania,
              onChanged: (compania) {},
              ),
          const SizedBox(height: 24),
          Center(child: guardarContacto()),
              
        ],
        
      ),
    );
  }
  Widget guardarContacto() => ButtonWidget(
      text: "Guardar",
      onClicked: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PaginaPerfil()),
        );
      });
  
}
