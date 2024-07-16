import 'package:flutter/material.dart';

class KevinCepedaLogin extends StatefulWidget {
  const KevinCepedaLogin({super.key});

  @override
  State<KevinCepedaLogin> createState() => _KevinCepedaLoginState();
}

class _KevinCepedaLoginState extends State<KevinCepedaLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == '999') {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Usuario o contraseña incorrectos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kevin Stalin Cepeda Yupanqui'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://as2.ftcdn.net/v2/jpg/02/98/13/93/1000_F_298139354_B8MchbDhUhOuAfcewRxZ9AUOKV9vsWAt.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Usuario'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Conectar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: const Center(
        child: Text('¡Has iniciado sesión correctamente!'),
      ),
    );
  }
}
