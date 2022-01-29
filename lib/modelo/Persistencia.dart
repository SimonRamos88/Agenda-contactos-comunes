import 'package:shared_preferences/shared_preferences.dart';

class Persitencia {
  static SharedPreferences preferenciasCompartidas =
      SharedPreferences.getInstance() as SharedPreferences;
  //Declarando un objeto SP, que nos permite guardar datos simples de forma clave:valor
  static const claveJSON = 'uxiono';

  static Future
      init() async => //Con esta funcion asincrona implementamos el objeto SP
          //De modo que se inicie y se prepare para leer o escribir datos

          preferenciasCompartidas = await SharedPreferences.getInstance();
  //Como es asincrona, necesitamos un await mientras se obtiene la confirmación del proceso

  static Future setJSON(String username) async =>
      //Con esta funcion asincrona escribimos un dato STRING al SP
      await preferenciasCompartidas.setString(claveJSON, username);
  /*
    if (userna!= null) {
      return a;
    }
    */

  //Con esta funcion asincrona leemos un dato STRING al SP
  static Future<String> getJSON() async {
    dynamic a = await preferenciasCompartidas.getString(claveJSON);
    if (a != null) {
      return a.toString();
    } else {
      print("Algo fallo");
      return a;
    }
  }
}
