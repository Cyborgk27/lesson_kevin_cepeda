import 'package:xml/xml.dart';

class User {
  final String urlImage;
  final String fechaNacimiento;
  final String correoElectronico;
  final String estadoCivil;

  User({
    required this.urlImage,
    required this.fechaNacimiento,
    required this.correoElectronico,
    required this.estadoCivil,
  });

  factory User.fromXml(XmlElement element) {
    return User(
      // ignore: deprecated_member_use
      urlImage: element.findElements('url_image').single.text,
      // ignore: deprecated_member_use
      fechaNacimiento: element.findElements('birthday').single.text,
      // ignore: deprecated_member_use
      correoElectronico: element.findElements('email').single.text,
      // ignore: deprecated_member_use
      estadoCivil: element.findElements('civil_state').single.text,
    );
  }
}