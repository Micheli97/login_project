import 'package:app/app/features/login/presentation/pages/login_presenter.dart';
import 'package:flutter/material.dart';

import 'components/cabecalho_login.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({required this.presenter, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      widget.presenter.isLoadingStream.listen((event) {
        if (event) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => SimpleDialog(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Aguarde ...', textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          );
        } else {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
        }
      });

      widget.presenter.mainErrorStream.listen(((event) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              event!,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }));

      widget.presenter.navegarStream.listen(((event) {
        if (event?.isNotEmpty == true) {
          Navigator.of(context).pushNamed(event!);
        }
      }));

      return SingleChildScrollView(
        child: Column(
          children: [
            const CabecalhoLogin(),
            Form(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.blueGrey))),
                    child: StreamBuilder<String?>(
                        stream: widget.presenter.emailErrorStream,
                        builder: (context, snapshot) {
                          return TextFormField(
                            decoration: InputDecoration(
                                label: const Text('Email'),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorText: snapshot.data),
                            onChanged: widget.presenter.emailValidar,
                          );
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.blueGrey))),
                    child: StreamBuilder<String?>(
                        stream: widget.presenter.passwordErrorStream,
                        builder: (context, snapshot) {
                          return TextFormField(
                            decoration: InputDecoration(
                              label: const Text('Senha'),
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorText: snapshot.data,
                            ),
                            onChanged: widget.presenter.senhaValidar,
                          );
                        }),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: StreamBuilder<bool>(
                          stream: widget.presenter.isFormValidStream,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: snapshot.data == true
                                  ? widget.presenter.loginEmail
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 30,
                                ),
                              ),
                              child: SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: const Center(
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
