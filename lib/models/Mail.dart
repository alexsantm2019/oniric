class Mail {
  final String pais;
  final String nombre;
  final String celular;
  final String email;
  final String solicitud;

  Mail({this.pais, this.nombre, this.celular, this.email, this.solicitud});

  factory Mail.fromJson(Map<String, dynamic> json) {
    return Mail(
        pais: json['pais'],
        nombre: json['nombre'],
        celular: json['celular'],
        email: json['email'],
        solicitud: json['solicitud']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["pais"] = pais;
    map["nombre"] = nombre;
    map["celular"] = celular;
    map["email"] = email;
    map["solicitud"] = solicitud;
    return map;
  }
}
