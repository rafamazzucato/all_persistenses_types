import 'package:all_persistenses_types/firebase/models/Car.dart';
import 'package:all_persistenses_types/nosql/models/Book.dart';
import 'package:all_persistenses_types/sqlite/models/Person.dart';
import 'package:flutter/material.dart';

class AddCar extends StatelessWidget {
  AddCar({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo carro"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Nome", labelText: "Nome"),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome do carro';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Marca", labelText: "Marca"),
                  controller: _brandController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira a marca do carro';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Car car = Car(_nameController.text, _brandController.text);
                        Navigator.pop(context, car);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
