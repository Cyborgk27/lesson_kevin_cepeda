import 'package:flutter/material.dart';

class KevinCepedaNewUser extends StatefulWidget {
  const KevinCepedaNewUser({super.key});

  @override
  State<KevinCepedaNewUser> createState() => _KevinCepedaNewUserState();
}

class _KevinCepedaNewUserState extends State<KevinCepedaNewUser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _fechaNacimiento;
  String? _nacionalidad;
  String? _estadoCivil;
  bool _isAdmin = false;

  final List<String> _nacionalidades = ['Ecuatoriana', 'Colombiana', 'Peruana', 'Otro'];
  final List<String> _estadosCiviles = ['Soltero', 'Casado', 'Divorciado', 'Viudo'];

  Future<void> _selectFechaNacimiento(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null && selectedDate != _fechaNacimiento) {
      setState(() {
        _fechaNacimiento = selectedDate;
      });
    }
  }

  void _guardarDatos() {
    if (_formKey.currentState!.validate()) {
      final String fechaNacimientoStr = _fechaNacimiento != null
          ? '${_fechaNacimiento!.toLocal()}'.split(' ')[0]
          : 'No seleccionada';
      final String isAdminStr = _isAdmin ? 'Sí' : 'No';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Datos Guardados'),
            content: Text(
              'Cédula: ${_cedulaController.text}\n'
              'Nombre: ${_nombreController.text}\n'
              'Apellidos: ${_apellidosController.text}\n'
              'Fecha de Nacimiento: $fechaNacimientoStr\n'
              'Nacionalidad: ${_nacionalidad ?? 'No seleccionada'}\n'
              'Estado Civil: ${_estadoCivil ?? 'No seleccionado'}\n'
              'Dirección: ${_direccionController.text}\n'
              'Correo Electrónico: ${_emailController.text}\n'
              'Administrador: $isAdminStr',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _borrarDatos() {
    _cedulaController.clear();
    _nombreController.clear();
    _apellidosController.clear();
    _direccionController.clear();
    _emailController.clear();
    setState(() {
      _fechaNacimiento = null;
      _nacionalidad = null;
      _estadoCivil = null;
      _isAdmin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _cedulaController,
                decoration: const InputDecoration(labelText: 'Cédula'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la cédula';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _apellidosController,
                decoration: const InputDecoration(labelText: 'Apellidos'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los apellidos';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la dirección';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Correo Electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el correo electrónico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Fecha de Nacimiento'),
                      subtitle: Text(_fechaNacimiento != null
                          ? '${_fechaNacimiento!.toLocal()}'.split(' ')[0]
                          : 'No seleccionada'),
                      trailing: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectFechaNacimiento(context),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _nacionalidad,
                decoration: const InputDecoration(labelText: 'Nacionalidad'),
                items: _nacionalidades.map((nacionalidad) {
                  return DropdownMenuItem(
                    value: nacionalidad,
                    child: Text(nacionalidad),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _nacionalidad = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione una nacionalidad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _estadoCivil,
                decoration: const InputDecoration(labelText: 'Estado Civil'),
                items: _estadosCiviles.map((estadoCivil) {
                  return DropdownMenuItem(
                    value: estadoCivil,
                    child: Text(estadoCivil),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _estadoCivil = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione un estado civil';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _isAdmin,
                    onChanged: (value) {
                      setState(() {
                        _isAdmin = value ?? false;
                      });
                    },
                  ),
                  const Text('¿Es Administrador?'),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _guardarDatos,
                    child: const Text('Guardar'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: _borrarDatos,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Borrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}