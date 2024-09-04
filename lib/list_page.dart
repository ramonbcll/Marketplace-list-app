// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String descricao = '';
  String quantidade = '';
  List<Map<String, dynamic>> produtos = [
    {'produto': 'Descrição', 'quantidade': '0', 'unidade': 'Un.', 'status': false}
  ];
  String unidade = 'Un.';

  @override
  Widget build(BuildContext context) {
    final routeLista = ModalRoute.of(context)?.settings.arguments as List<Map<String, dynamic>>;
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
                Navigator.of(context).pushReplacementNamed('/home', arguments: routeLista);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/', arguments: routeLista);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Create List Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.check_outlined),
            onPressed: () {
              routeLista.isEmpty ? routeLista.add({'lista': produtos}) : routeLista;
              Navigator.of(context).pushReplacementNamed('/home', arguments: routeLista);
              print('save button');
            },
          )
        ],
      ),     
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          openDialog();
        },
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(produtos[index]['produto']),
            background: Container(
              color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 18),
                    Text("Excluir",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
            ),
            child: CheckboxListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text('${produtos[index]['produto']}'),
                  ),
                  Text('${produtos[index]['quantidade']}'),
                  SizedBox(width: 15,),
                  Text('${produtos[index]['unidade']}'),
                ],
              ),//Text('${produtos[index]['produto']} - ${produtos[index]['quantidade']} ${produtos[index]['unidade']}'),
              value: produtos[index]['status'],
              onChanged: (bool? value) {
                setState(() {
                  produtos[index]['status'] = value!;
                });
              },
            ),
            onDismissed: (direction) {
              setState(() {
                produtos.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Produto'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (text) {
              descricao = text;
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
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Unidade',
                    border: OutlineInputBorder(),
                  ),
                  value: unidade.isNotEmpty ? unidade : 'Un.',
                  items: <String>['Un.', 'Cx.', 'Kg.'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      unidade = value!;
                    });
                  },
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
            setState(() {
              if (produtos[0]['produto'] == 'Descrição') {
                produtos.removeAt(0);
              }
              produtos.add({
                'produto': descricao,
                'quantidade': quantidade.replaceAll(',', '.'),
                'unidade': unidade,
                'status': false,
              });
            });
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
