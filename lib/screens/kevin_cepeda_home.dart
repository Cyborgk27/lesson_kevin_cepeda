import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;

class KevinCepedaHome extends StatefulWidget {
  const KevinCepedaHome({super.key});

  @override
  State<KevinCepedaHome> createState() => _KevinCepedaHomeState();
}

class _KevinCepedaHomeState extends State<KevinCepedaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Foto de perfil
          Container(
            margin: const EdgeInsets.all(16.0),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('https://scontent.fgye6-1.fna.fbcdn.net/v/t39.30808-6/347789043_1416996995809932_5994037853075979388_n.jpg?stp=dst-jpg_p206x206&_nc_cat=103&ccb=1-7&_nc_sid=fe5ecc&_nc_eui2=AeHGYn9KzI5gDykCrn8oSypvO0sZCgfwz507SxkKB_DPnX_7SWUmWjSc73bThR-Bpy7e2Q2AQ-2Y-pZLvCUGXJKe&_nc_ohc=ThB9gwl901EQ7kNvgGVv7uC&_nc_ht=scontent.fgye6-1.fna&oh=00_AYBsY-w1GMLN8Ews3CbaF8P0FYVFilkN1ekU69_M0Q7mSw&oe=66B6DEE6'),
              backgroundColor: Colors.transparent,
            ),
          ),
          // Tarjeta con datos personales
          const Card(
            margin: EdgeInsets.all(16.0),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre: Kevin Stalin',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Apellidos: Cepeda Yupanqui',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Edad: 23',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fecha de Nacimiento: 2001-08-27',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}