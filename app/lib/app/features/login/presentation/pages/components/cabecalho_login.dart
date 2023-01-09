import 'package:flutter/material.dart';

class CabecalhoLogin extends StatelessWidget {
  const CabecalhoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
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
    );
  }
}
