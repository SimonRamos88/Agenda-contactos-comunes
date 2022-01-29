/*mport 'dart:convert';
import 'Contacto.dart';

void main() {
  
  String jsonContactos = jsonEncode(Contactos.contactos);
  print(jsonContactos);

  
  jsonContactos is String ? print("si") : print("no");
  var listaConts_js = jsonDecode(jsonContactos) as List;
  List<Contacto> contactosDeNuevo =
      listaConts_js.map((index) => Contacto.fromJson(index)).toList();
  //print(contactosDeNuevo);
  for (int i = 0; i < contactosDeNuevo.length; i++) {
    print("Elemento: $i ${contactosDeNuevo[i]}");
  }
}*/
