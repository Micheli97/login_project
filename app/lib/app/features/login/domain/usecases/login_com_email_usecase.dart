import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class LoginComEmail {
  Future<void> autenticacao(LoginCredencialEntity credencial);
}

class LoginComEmailCredenciais extends Equatable {
  final String email;
  final String password;

  @override
  List get props => [email, password];

  const LoginComEmailCredenciais({
    required this.email,
    required this.password,
  });
}