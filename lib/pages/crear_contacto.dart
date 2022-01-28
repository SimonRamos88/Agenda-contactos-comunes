import 'package:flutter/material.dart';
import 'package:agenda/datos/Paletas.dart';
import 'package:agenda/Logica/Metodos.dart';

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
          textTheme: const TextTheme(button: TextStyle(color: Colors.black)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedLabelStyle: TextStyle(color: Colors.black),
              unselectedLabelStyle: TextStyle(color: Colors.black))),
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
  String nombre = "";
  String apellido = "";
  String compania = "";
  int num1 = 0;
  int num2 = 0;

  bool _subido = false;

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
      ),
      body: Center(
          child: Container(
              color: const Color(0xffB4C2DD),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: keyform,
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(Icons.person, size: 150),
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
                                              BorderRadius.circular(12)),
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
                                    if (apellido.isEmpty) {
                                      print("Soy el validatorV2");
                                      return "Ingrese un valor";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Apellido",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  onChanged: (text) =>
                                      setState(() => apellido = text),
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts, color: Colors.black),
              label:
                  "Contactos " //Text("Contactos", style: TextStyle(color:Colors.black) )
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add, color: Colors.black),
              label: "Añadir")
        ],
        onTap: (int tapIndex) {
          tapIndex == 0 ? Navigator.pushNamed(context, "/") : null;
        },
      ),

      floatingActionButton: FloatingActionButton(
        //Falta crear el contacto, y ponerlo en este metodo
        onPressed: () {
          if (nombre.isNotEmpty && apellido.isNotEmpty && compania.isNotEmpty) {
            subir();
            print("Entro");
            Metodos.CrearContacto(
                nombre, num1, num2, compania, apellido, "slakla");
            print(Metodos.contactos);
            Navigator.pushNamed(context, "/");
          } else {
            print("No entro");
            //return null;
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      /*
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.book_outlined, color: Colors.black),
            //label: "xd",
            label:
                "Contactos " //Text("Contactos", style: TextStyle(color:Colors.black) )
            ),
        BottomNavigationBarItem(
            icon: Icon(Icons.book_online, color: Colors.black),
            //activeIcon: Icon(Icons.book, color: Colors.black),
            label: "Añadir")
      ]),
      */
      //floatingActionButton: FloatingActionButton(
      //Falta crear el contacto, y ponerlo en este metodo

/*
        onPressed: Metodos.agregarContacto(),
        tooltip: 'Agregar',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
*/
    );
  }
}
