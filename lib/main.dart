// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'dart:math';
import '/components/user_form.dart';
import '/components/user_list.dart';
import 'package:flutter/material.dart';
import '/models/user.dart';


main() => runApp(CadastroApp());
 
class CadastroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        
      ),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  final _users = [
    User(
      id: 't1',
      name: 'teste',
      number: '217i867',
      email: 'jonas@gmail',
      date: DateTime.now(),
      document: "29839898"
    ),
  ];
 
  void _addUser(String name, String number, DateTime date, String email, String document) {
    final newUser = User(
      id: Random().nextDouble().toString(),
      name: name,
      number: number,
      date: date,
      email: email,
      document: document,
    );
 
    setState(() {
      _users.add(newUser);
    });
 
    Navigator.of(context).pop();
  }

  _deleteUser(String id){
    setState(() {
      _users.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

 
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return UserForm(_addUser);
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuarios'),

        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            UserList(_users, _deleteUser),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
