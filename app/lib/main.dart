import 'package:app/config_login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginPage(),
      routes: {
        '/success': (ctx)=> const Scaffold(body: Center(child: Text('Voce está logadooo!!!')),)
      },
    ); 
  }
}