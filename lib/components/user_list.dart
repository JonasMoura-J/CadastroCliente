// ignore_for_file: prefer_const_constructors, empty_constructor_bodies

import 'dart:math';

import 'package:app_cadastro/components/user_edit.dart';
import 'package:app_cadastro/components/user_form.dart';
import 'package:app_cadastro/components/user_visualization.dart';
import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  

  final List<User> users;
  final void Function(String) onRemove;
  final void Function(String, String, String, DateTime, String, String) onEdit;

  UserList(this.users, this.onRemove, this.onEdit);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

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
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
      
        width: double.infinity,
         
        height: 600,
        child: ListView.builder(
          
          itemCount: widget.users.length,
          itemBuilder: (ctx, index){
            final tr = widget.users[index];
            return Card(
              color: Theme.of(context).colorScheme.secondary,
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
                  tr.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
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
                      onPressed: () {
                        widget.onEdit(tr.id, tr.name, tr.email, tr.date, tr.number, tr.document);
                      }
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () => widget.onRemove(tr.id),
                    )
                  ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}