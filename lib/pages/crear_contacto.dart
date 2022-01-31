import 'package:flutter/material.dart';
import 'package:agenda/datos/Paletas.dart';
import 'package:agenda/Logica/Metodos.dart';
import 'dart:io'  show File;
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../camara.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Paletas.primaryWhite,
          textTheme: const TextTheme(button: TextStyle(color: Colors.white)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.white))),
      home: PrincipalPage(),
    );
  }
}

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);
  String tittle = "Crear contacto";

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  Color color_interfaz = Color(0xff7676CC);
  Color color_interfazGrueso = Color(0xff1E1E34);
  Color color_letra = Color(0xffE4E4E4);
  Color color_fondo = Color(0xffE4E4E4);

  String nombre = "";
  String email = "";
  String compania = "";
  int num1 = 0;
  int num2 = 0;

  bool _subido = false;

  var widgetCamra = FotoUsuario(); 

  final keyform = GlobalKey<FormState>();

   
  subir() {
    setState(() => _subido = true);
    if (keyform.currentState!.validate()) {
      keyform.currentState!.save();
      //widget.onSubmit(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.tittle),
        backgroundColor: color_interfazGrueso,
      ),
      body: Center(
          child: Container(
              color: color_fondo,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: keyform,
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left:10, right: 20, top: 10),
                              //color: Colors.black,
                              width: 130,
                              height: 180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: color_interfaz,
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(13)
                            ),
                            child: widgetCamra
                                                                          
                          )
                          ]
                        ),
                        Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              TextFormField(
                                  initialValue: "",
                                  validator: (text) {
                                    if (nombre.isEmpty) {
                                      print("Soy el validatorV2");
                                      return "Ingrese un valor";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Nombre",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)
                                      ),
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                  onChanged: (text) =>
                                      setState(() => nombre = text),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction
                                  //_subido ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                  ),
                              const SizedBox(height: 50),
                              TextFormField(
                                  initialValue: "",
                                  validator: (text) {
                                    if (email.isEmpty) {
                                      print("Soy el validatorV2");
                                      return "Ingrese un valor";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  onChanged: (text) =>
                                      setState(() => email = text),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction
                                  // _subido ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                                  ),
                            ]))
                      ],
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                        initialValue: "",
                        validator: (text) {
                          if (compania.isEmpty) {
                            print("Soy el validatorV2");
                            return "Ingrese un valor";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Compañía",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (text) => setState(() => compania = text),
                        autovalidateMode: AutovalidateMode.onUserInteraction
                        //_subido ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                        ),
                    const SizedBox(height: 30),
                    TextFormField(
                        initialValue: "",
                        validator: (text) {
                          if (num1 == 0) {
                            print("Soy el validatorV2");
                            return "Valor diferente a 0";
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Numero1",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (num) => setState(() =>
                            num.isNotEmpty ? num1 = int.parse(num) : num1 = 0),
                        autovalidateMode: AutovalidateMode.onUserInteraction
                        //_subido ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                        ),
                    const SizedBox(height: 30),
                    TextFormField(
                        initialValue: "",
                        validator: (text) {
                          if (num2 == 0) {
                            print("Soy el validatorV2");
                            return "Valor diferente a 0";
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Numero2",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (num) => setState(() =>
                            num.isNotEmpty ? num2 = int.parse(num) : num2 = 0),
                        autovalidateMode: AutovalidateMode.onUserInteraction
                        // _subido ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                        ),
                  ],
                ),
              ))),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: color_interfazGrueso,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts, color: Colors.white),
              label:
                  "Contactos " //Text("Contactos", style: TextStyle(color:Colors.black) )
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add, color: Colors.white),
              label: "Añadir")
        ],
        onTap: (int tapIndex) {
          tapIndex == 0 ? Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false) : null;
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: color_interfaz,
        //Falta crear el contacto, y ponerlo en este metodo
        onPressed: () {
          if (nombre.isNotEmpty && email.isNotEmpty && compania.isNotEmpty) {
            subir();
            
            print("Entro");
           
            Metodos.CrearContacto(
                nombre, num1, num2, compania, email, "https://www.asofiduciarias.org.co/wp-content/uploads/2018/06/sin-foto.png");

            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          } else {
            print("No entro");
            //return null;
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );
  }
}
