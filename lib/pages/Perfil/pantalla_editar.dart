import 'package:flutter/material.dart';
import 'package:agenda/widget/appbar_widget.dart';
import 'package:agenda/widget/profile_widget.dart';
import 'package:agenda/widget/button._widget.dart';
import 'package:agenda/modelo/Contacto.dart';
import 'package:agenda/widget/textField_widget.dart';
import 'package:agenda/widget/button._widget.dart';
import 'pantalla_perfil.dart';
import 'package:agenda/Logica/Metodos.dart';
import 'package:agenda/pages/Libreta.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilEstado createState() => _EditarPerfilEstado();
}

class _EditarPerfilEstado extends State<EditarPerfil> {
  Color color_interfaz = Color(0xff9AD0EC);
  Color color_interfazGrueso = Color(0xff1572A1);
  Color color_letra = Color(0xffEFDAD7);
  Color color_fondo = Color(0xffE4E4E4);

  Contacto contacto = Metodos.contactoActual;

  late TextEditingController controllernombreCompleto;
  late TextEditingController controlleremail;
  late TextEditingController controllertelefono1;
  late TextEditingController controllertelefono2;
  late TextEditingController controllercompania;

  String prueba = " ";
  @override
  Widget build(BuildContext context) {
    controllernombreCompleto = TextEditingController(text: contacto.nombre);
    controlleremail = TextEditingController(text: contacto.email);
    controllertelefono1 =
        TextEditingController(text: contacto.telefono1.toString());
    controllertelefono2 =
        TextEditingController(text: contacto.telefono2.toString());
    controllercompania = TextEditingController(text: contacto.compania);
    return Scaffold(
      backgroundColor: color_fondo,
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(30.0),
        children: [
          ProfileWidget(
            imagePath: contacto.linkFoto,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre completo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                  controller: controllernombreCompleto,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  )),
              const SizedBox(height: 10),
              Text(
                "Email:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controlleremail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Teléfono 1:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllertelefono1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Teléfono 2:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllertelefono2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Compañía: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controllercompania,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
         
          const SizedBox(height: 24),
          Center(child: guardarContacto()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    controllernombreCompleto.dispose();
    controllercompania.dispose();
    controllertelefono1.dispose();
    controlleremail.dispose();
    controllertelefono2.dispose();
    super.dispose();
  }

  Widget guardarContacto() => ButtonWidget(
      text: "Guardar",
      onClicked: () {
        //Aqui verificamos que la informacion se guarde, y la remitimos al metodo editar contacto
        print(controllernombreCompleto.text);
        Metodos.EditarContacto(
            controllernombreCompleto.text,
            controlleremail.text,
            int.parse(controllertelefono1.text),
            int.parse(controllertelefono2.text),
            controllercompania.text,
            contacto);
        print("Esta va para juan");
     
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);

        
      });
}
