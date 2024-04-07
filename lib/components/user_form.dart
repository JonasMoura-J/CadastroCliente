import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UserForm extends StatefulWidget {

  final void Function(String, String, DateTime, String, String) onSubmit;

  UserForm(this.onSubmit);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _emailController = TextEditingController();
  final _documentController = TextEditingController();

  _submitForm(){
    final name = _nameController.text; 
    final number = _numberController.text;
    final email = _emailController.text;
    final document = _documentController.text;



    if(name.isEmpty || number.isEmpty || email.isEmpty || document.isEmpty) {
      return;
    }
    widget.onSubmit(name, number, _selectedDate, email, document);
  }

  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1910),
      lastDate: DateTime.now(),
    ).then((pickedDate)  {
      if(pickedDate == null) return;

      setState((){
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Nome:'
              ),
            ),
            TextField(
              controller: _numberController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
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

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextField(
              controller: _documentController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Documento'
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm, 
                  child: const Text(
                    'Adicionar Usuario',
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