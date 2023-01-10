import 'package:equatable/equatable.dart';

import '../entities/login_credencial_entity.dart';

abstract class LoginComEmail {
  Future<void> autenticacao(LoginCredencialEntity credencial);
}

class LoginComEmailCredenciais extends Equatable implements LoginCredencialEntity {
  @override
  final String email;
  
  @override
  final String senha;

  @override
  List get props => [email, senha];

  const LoginComEmailCredenciais({
    required this.email,
    required this.senha,
  });
  
}