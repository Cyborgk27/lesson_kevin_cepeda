import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_kevin_cepeda/models/kevin_cepeda_user.dart';
import 'package:xml/xml.dart' as xml;

class KevinCepedaConsulta extends StatefulWidget {
  const KevinCepedaConsulta({super.key});

  @override
  State<KevinCepedaConsulta> createState() => _KevinCepedaConsultaState();
}

class _KevinCepedaConsultaState extends State<KevinCepedaConsulta> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final String xmlString = await rootBundle.loadString('assets/users.xml');
      final xml.XmlDocument document = xml.XmlDocument.parse(xmlString);
      final List<xml.XmlElement> userElements = document.findAllElements('user').toList();

      setState(() {
        users = userElements.map((element) => User.fromXml(element)).toList();
      });
    } catch (e) {
      print('Error cargando usuarios: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Usuarios'),
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        user.urlImage,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          user.correoElectronico,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Fecha de Nacimiento: ${user.fechaNacimiento}\nEstado Civil: ${user.estadoCivil}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
        child: const Icon(Icons.keyboard_return),
      ),
    );
  }
}