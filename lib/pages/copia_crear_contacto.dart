/*
import 'package:flutter/material.dart';
import 'package:agenda/datos/Paletas.dart';
import 'package:agenda/Logica/Metodos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  List<String> datos = ["Compañía", "Número 1", "Número 2"];

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _counter = 0;
  String nombre = "";
  String apellido = "";
  String compania = "";
  String numero1 = "00";
  String numero2 = "00";
  final keyform = GlobalKey<FormState>();
  late TextEditingController nombreControler = TextEditingController();
  late TextEditingController apellidoControler = TextEditingController();
  late TextEditingController compControler = TextEditingController();
  late TextEditingController numControler = TextEditingController();
  late TextEditingController num2Controler = TextEditingController();
 
  String validar(value) {
    if (value.isEmpty) {
      return ("llena los campos vacíos");
    } 
    return "";
  }
  /*
  GuardarDatos(BuildContext context){

    if(keyform.currentState!.validate()){
        keyform.currentState!.save();
        Metodos.CrearContacto(nombreControler.text, int.parse(numControler.text), int.parse(num2Controler.text), compControler.text,apellidoControler.text, "skajk" );
    }
  }
  */

  @override
  dispose(){
    super.dispose();
    nombreControler.dispose();
    apellidoControler.dispose();
    compControler.dispose();
    numControler.dispose();
    num2Controler.dispose();


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
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(Icons.person, size: 150),
                        Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              Container(
                                width: 240,
                                height: 80,
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                    initialValue: "",
                                    //controller: nombreControler,
                                    decoration: InputDecoration(
                                      labelText: "Nombre",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                    onSaved: (value) => nombre = value!,
                                    validator: validar),
                                //
                                /*
                          decoration: const BoxDecoration(
                            color: Color(0xff526370),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0))*/
                              ),
                              const SizedBox(height: 50),
                              TextFormField(
                                  initialValue: "",
                                  //controller: apellidoControler,
                                  decoration: InputDecoration(
                                    
                                    labelText: "Apellido",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  onSaved: (value) => apellido = value!,
                                  validator: validar),
                            ]))
                      ],
                    ),
                    /*Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),*/
                    const SizedBox(height: 50),
                    TextFormField(
                        initialValue: "",
                        //controller: compControler,
                        decoration: InputDecoration(
                          labelText: "Compañía",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintStyle: TextStyle(color: Colors.white),
                        ),                       
                        onSaved: (value) => compania = value!,
                        validator: validar),
                    const SizedBox(height: 30),
                    TextFormField(
                      initialValue: "0000",
                      keyboardType:TextInputType.phone ,
                      //controller: numControler,
                        decoration: InputDecoration(
                          labelText: "Numero1",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onSaved: (value) => numero1 = value!,
                        validator: validar),
                    const SizedBox(height: 30),
                    TextFormField(
                      initialValue: "0000",
                      keyboardType:TextInputType.phone ,
                      //controller: num2Controler,
                        decoration: InputDecoration(
                          labelText: "Numero2",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onSaved: (value) => numero2 = value!,
                        validator: validar),
                  ],
                ),
              ))),

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

      
      floatingActionButton: FloatingActionButton(
        
        //Falta crear el contacto, y ponerlo en este metodo
        onPressed:() {bool bandera = true;
                     if(keyform.currentState!.validate() && bandera){
                          keyform.currentState!.save();
                          Metodos.CrearContacto(nombre, int.parse(numero1), int.parse(numero2), compania,apellido, "skajk" );
                          bandera = false;
                          }
                          print("entro");;
                          print("NoEntro");
                        } ,//GuardarDatos(context),
        tooltip: 'Increment',
        child: const Icon(Icons.traffic),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  /*Solucion aprcial a algo

  () { if(keyform.currentState!.validate()){
                          keyform.currentState!.save();
                          Metodos.CrearContacto(nombre, int.parse(numero1), int.parse(numero2), compania,apellido, "skajk" );};
                        }*/


  }

  /*
  GuardarDatos(BuildContext context){
    
    if(keyform.currentState!.validate()){
        keyform.currentState!.save();
        Metodos.CrearContacto(nombre, int.parse(numero1), int.parse(numero2), compania, apellido,"skajk" );
    }
  }*/
}
*/