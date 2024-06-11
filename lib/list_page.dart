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
  String quantidade = '';
  List produto = [];
  String unidade = '';

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
              labelText: 'Descrição',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.clear)
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(
                width: 120.0,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    quantidade = value;
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              SizedBox(
                width: 100,
                height: 57,
                child: DropdownMenu(
                  label: Text('Unidade'),
                  width: 100,
                  initialSelection: 'Un.',
                  onSelected: (value) {
                    unidade = value!;
                  },
                  dropdownMenuEntries: <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: 'Un.', label: 'Un.'),
                    DropdownMenuEntry(value: 'Cx.', label: 'Cx.'),
                    DropdownMenuEntry(value: 'Kg.', label: 'Kg.')
                  ],
                  inputDecorationTheme: InputDecorationTheme(
                    constraints: BoxConstraints.tight(Size.fromHeight(65)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    )
                  )
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => _pop(),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            produto.add({
              'produto': descricao,
              'quantidade': quantidade.replaceAll(',', '.'),
            });
            print(descricao);
            print(quantidade);
            _pop();
          },
          child: Text('Salvar')
        ),
      ],
    )
  );

  void _pop() {
    Navigator.pop(context);
  }
}