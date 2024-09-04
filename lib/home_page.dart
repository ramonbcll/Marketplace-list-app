// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {
  int count = 0;
  // late final List<Map<String, dynamic>> listas;

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
        title: Text("Home Page"),
        actions: [
          CustomSwitch()
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $count'),
            Container(height: 10,),
            CustomSwitch(),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            Navigator.of(context).pushReplacementNamed('/list', arguments: routeLista);
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  final bool isDartTheme = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
          value: AppController.instance.isDartTheme,
          onChanged: (value) {
            setState(() {
              value = isDartTheme;
            });
            AppController.instance.changeTheme();
          },
        );
  }
}