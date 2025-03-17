import 'package:flutter/material.dart';
import 'database_helper2.dart';


class Practica4 extends StatefulWidget {
  @override
  _Practica4State createState() => _Practica4State();
}

class _Practica4State extends State<Practica4> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final DatabaseHelper2 _databaseHelper = DatabaseHelper2();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  // Cargar todos los usuarios desde la base de datos
  void _loadUsers() async {
    List<User> users = await _databaseHelper.getUsers();
    setState(() {
      _users = users;
    });
  }

  // Agregar un nuevo usuario a la base de datos
  void _addUser() async {
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0;
    if (name.isNotEmpty && age > 0) {
      final user = User(name: name, age: age);
      await _databaseHelper.insertUser(user);
      nameController.clear();
      ageController.clear();
      _loadUsers(); // Recargar la lista de usuarios
    }
  }

  // Eliminar el primer usuario
  void _deleteFirstUser() async {
    await _databaseHelper.deleteFirstUser();
    _loadUsers(); // Recargar la lista después de la eliminación
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Database'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campos de texto para nombre y edad
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 20),
            // Botón para agregar un usuario
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Add User'),
            ),
            SizedBox(height: 20),
            // Botón para eliminar el primer usuario
            ElevatedButton(
              onPressed: _deleteFirstUser,
              child: Text('Delete First User'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text('Age: ${user.age}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
