import '../entities/entities.dart';

abstract class LoginComEmail {
  Future<void> autenticacao(LoginCredencialEntity credencial);
}