// ignore_for_file: prefer_const_constructors, empty_constructor_bodies

import 'dart:math';

import 'package:app_cadastro/components/user_visualization.dart';
import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  

  final List<User> transactions;
  final void Function(String) onRemove;

  UserList(this.transactions, this.onRemove);

  _openUserModal(BuildContext context, User user) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return UserVisualization(user);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              onTap: () { 
                User user = User(id: tr.id, name: tr.name, number: tr.number, date: tr.date, email: tr.email, document: tr.document);
                _openUserModal(context, user);
              },
              title: Text(
                tr.name
              ),
              subtitle: Text(
                tr.email
              ),
              trailing: Row(    
                mainAxisSize: MainAxisSize.min,      
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () => onRemove(tr.id),
                  )
                ]
              ),
            ),
          );
        },
      ),
    );
  }
}