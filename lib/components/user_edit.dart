
import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UserEdit extends StatefulWidget {
  
  final void Function(String, String, String, DateTime, String, String) onSubmit;

  UserEdit(this.onSubmit);

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {

  final _idControler = TextEditingController();
  final _nameController = TextEditingController();

  final _numberController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  final _emailController = TextEditingController();

  final _documentController = TextEditingController();

  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1910),
      lastDate: DateTime.now(),
    ).then((pickedDate)  {
      if(pickedDate == null) return;

      _selectedDate = pickedDate;
    });
  }

  _submitForm(){
    final name = _nameController.text; 
    final number = _numberController.text;
    final email = _emailController.text;
    final document = _documentController.text;



    if(name.isEmpty || number.isEmpty || email.isEmpty || document.isEmpty) {
      return;
    }
    widget.onSubmit(_idControler.toString(), name, number, _selectedDate, email, document);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget> [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome:'
              ),
            ),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Celular:'
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      DateFormat('dd/MM/y').format(_selectedDate)
                    ),
                  ),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: const Text('Selecionar Data de nascimento'),
                  )
                ],
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email:'
              ),
            ),
            TextFormField(
              controller: _documentController,
              decoration: const InputDecoration(
                labelText: 'Documento:'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _submitForm(),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.purple),
                    ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  child: const Text(
                    'Fechar',
                    style: TextStyle(color: Colors.purple),
                    ),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}

