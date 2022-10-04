class Usuario {
  String? nombre;
  int? edad;
  List<String>? profesiones;

  Usuario({this.nombre, this.edad, this.profesiones});

  copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
