// ignore: file_names

class Contacto {
  late String linkFoto;
  late String nombre;
  late String compania;
  late int telefono1;
  late int telefono2;
  late String email;

  Contacto(this.nombre, this.telefono1, this.telefono2, this.compania,
      this.email, this.linkFoto);

  //{int? telefono2, String? linkFoto, String? email}
  //telefono2 ??= 00000;
  // linkFoto ??= " ";
  // email ??= " ";

  String get Nombre {
    return nombre;
  }

  String get Email {
    return email;
  }

  String get LinkFoto {
    return linkFoto;
  }

  String get Compania {
    return compania;
  }

  int get Telefono1 {
    return telefono1;
  }

  int get Telefono2 {
    return telefono1;
  }

  set Nombre(String n) => nombre = n;
  set Compania(String c) => compania = c;
  set Email(String e) => email = e;
  set Telefono1(int x) => telefono1 = x;
  set Telefono2(int y) => telefono2 = y;
  set LinkFoto(String l) => linkFoto = l;

  factory Contacto.fromJson(dynamic json) {
    return Contacto(
        json['nombre'] as String,
        json['telefono1'] as int,
        json['telefono2'] as int,
        json['compania'] as String,
        json['email'] as String,
        json['linkfoto'] as String);
  }

  Map toJson() => {
        'nombre': nombre,
        'telefono1': telefono1,
        'telefono2': telefono2,
        'compania': compania,
        'email': email,
        'linkfoto': linkFoto,
      };

  /*
    @override
  String toString() {
    return '{ ${this.name}, ${this.quantity} }';
  }
}

*/

/*
    Animales.fromJson(Map JsonMap){
    this.nombre = JsonMap["nombre"];
    this.tipo = JsonMap["tipo"];

  }*/

  @override
  String toString() {
    String cad =
        "Nombre: $nombre, Compania: $compania, Telefono 1: $telefono1, Telefono 2: $telefono2,  Email: $email";

    return cad;
  }
}
