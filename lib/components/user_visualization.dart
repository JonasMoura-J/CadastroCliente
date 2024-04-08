import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UserVisualization extends StatelessWidget {

  final User user;

  UserVisualization(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget> [
            TextFormField(
              readOnly: true,
              initialValue: user.name,
              decoration: const InputDecoration(
                labelText: 'Nome:'
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: user.number,
              decoration: const InputDecoration(
                labelText: 'Celular:'
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: DateFormat('dd/MM/y').format(user.date),
              decoration: const InputDecoration(
                labelText: 'Data de nascimento:'
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: user.email,
              decoration: const InputDecoration(
                labelText: 'Email:'
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: user.document,
              decoration: const InputDecoration(
                labelText: 'Documento:'
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    onPressed: () => Navigator.of(context).pop(), 
                    child: const Text(
                      'Fechar',
                      style: TextStyle(color: Colors.white),
                      ),
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

