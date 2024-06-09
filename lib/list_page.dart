// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String descricao = '';
  double quantidade = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: Image.asset('assets/images/user.png')
              ),
              accountName: Text('Ramon'),
              accountEmail: Text('Administrador')
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela de início'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Create List Page"),
        actions: [
          CustomSwitch()
        ],
      ),     
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            openDialog();
          });
        },
      ), 
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Produto'),
      content: Column(
        children: [
          TextField(
            onChanged: (text) {
              descricao = text;
              print(descricao);
            },
            decoration: InputDecoration(
              hintText: 'Descrição',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.clear)
            ),
          ),
          SizedBox(height: 15.0,),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              quantidade = value as double;
            },
            decoration: InputDecoration(
              hintText: 'Quantidade',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.clear)
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            print(descricao);            
            print(quantidade);
          },
          child: Text('Salvar')
        )
      ],
    )
  );
}