import 'dart:io'  show File;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
/*

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
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(button: TextStyle(color: Colors.black)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedLabelStyle: TextStyle(color: Colors.black),
              unselectedLabelStyle: TextStyle(color: Colors.black)
          )
      ),
      home: FotoUsuario(),
    );
  }
}

*/
class FotoUsuario extends StatefulWidget{
  
  FotoUsuario({Key? key}) : super(key: key);
  _FotoUsuarioScreenState createState() => _FotoUsuarioScreenState();

  File? imageFile = null;
                                            
}

class _FotoUsuarioScreenState extends State<FotoUsuario>{

  

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? picture = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      widget.imageFile = File(picture!.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Seleccione para abrir su galería"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: const Text("Galeria"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                  ],
                ),
              )
          );
        }
    );
  }


  @override
  Widget build(BuildContext conext){

    return Scaffold( 
      body:Center(
        child: IconButton(
          onPressed: () async{ print("Galeria"); _showSelectionDialog(context);}, 
          icon:
          widget.imageFile == null? Icon(Icons.photo_outlined, color: Colors.white) : Image.file(File(widget.imageFile!.path)),
          iconSize: 120,
        )
      ),
      backgroundColor: Colors.black,
    );
  } 
}