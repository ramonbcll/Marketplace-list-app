// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String login = '';
  String senha = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 80.0, width: 80.0,),
              SizedBox(height: 30),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 12),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          login = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Login',
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextField(
                        onChanged: (text) {
                          senha = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      ElevatedButton(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text('Entrar', textAlign: TextAlign.center,)
                        ),
                        onPressed: () {
                          if(login == "admin" && senha == "admin") {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print("Login incorreto!");
                          }
                        },
                      )
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/background.jpg', fit: BoxFit.cover),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          _body()
        ],
      )
    );
  }
}