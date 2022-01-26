import 'package:flutter/material.dart';
import 'Paletas.dart';

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
          unselectedLabelStyle: TextStyle(color: Colors.black)
          )
          
      ),
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
  var nombre;
  var apellido;
  var compania;
  var numero1;
  var numero2;

  String validar(value){
    
    if(value.isEmpty){
      return("llena los campos vacíos");
    }else{
      return("");
    }

  }
  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
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
            child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const Icon( Icons.person, size: 150),
                  Expanded(
                    child: Column(  
                      mainAxisAlignment: MainAxisAlignment.spaceAround ,
                      children: [
                        Container(
                          width: 240,
                          height: 80,
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                                        labelText: "Nombre",
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        hintStyle: TextStyle(color: Colors.white),
                                  ),
                            onSaved: (value) => nombre =  value,
                            validator: validar ),
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
                          decoration: InputDecoration(
                                        labelText: "Apellido",
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        hintStyle: TextStyle(color: Colors.white),
                                  ),
                          onSaved: (value) => apellido =  value,
                          validator: validar),

                      ])
                    )
                ],
                
                
              ),
              /*Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),*/
              
              TextFormField(
                          decoration: InputDecoration(
                                        labelText: "Compañía",
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        hintStyle: TextStyle(color: Colors.white),
                                  ),
                          onSaved: (value) => compania =  value,
                          validator: validar),
              TextFormField(
                          decoration: InputDecoration(
                                        labelText: "Numero1",
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        hintStyle: TextStyle(color: Colors.white),
                                  ),
                          onSaved: (value) => numero1 =  value,
                          validator: validar),
              TextFormField(
                          decoration: InputDecoration(
                                        labelText: "Numero2",
                                        border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        hintStyle: TextStyle(color: Colors.white),
                                  ),
                          onSaved: (value) => numero2 =  value,
                          validator: validar
                          ), 
              
            
            ],
          ),
          )
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [ BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.book_outlined, color: Colors.black),
            //label: "xd",
            label: "Contactos "//Text("Contactos", style: TextStyle(color:Colors.black) )
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.book_online, color: Colors.black),
            //activeIcon: Icon(Icons.book, color: Colors.black),
            label: "Añadir"
          )
        ]
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
