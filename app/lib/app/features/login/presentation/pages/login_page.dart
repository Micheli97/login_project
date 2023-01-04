import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .6,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Entre na sua conta',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Form(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.blueGrey))),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.blueGrey))),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 30,
                          ),
                        ),child: SizedBox(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Center(
                      child: Text(
                        'Entrar' ,
                        style: TextStyle(
                            color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
