import 'package:flutter/material.dart';
import 'package:lesson_kevin_cepeda/screens/kevin_cepeda_consulta.dart';
import 'package:lesson_kevin_cepeda/screens/kevin_cepeda_home.dart';
import 'package:lesson_kevin_cepeda/screens/kevin_cepeda_new_user.dart';

class KevinCepedaMain extends StatefulWidget {
  const KevinCepedaMain({super.key});

  @override
  State<KevinCepedaMain> createState() => _KevinCepedaMainState();
}

class _KevinCepedaMainState extends State<KevinCepedaMain> {
    int currentPageIndex = 0;

    List<Widget> pages = [
      const KevinCepedaHome(),
      const KevinCepedaNewUser(),
      const KevinCepedaConsulta()
    ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Usuario',
          ),
          NavigationDestination(
            icon: Icon(Icons.verified_user_outlined),
            label: 'Consulta',
          ),
        ],
      ));
  }
}