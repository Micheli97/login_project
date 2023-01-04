import 'package:app/app/features/login/domain/entities/login_credencial_entity.dart';

import './login_com_email_usecase.dart';

class LoginComEmailImpl implements LoginComEmail{
  @override
  Future<void> autenticacao(LoginCredencialEntity credencial) async {
    throw UnimplementedError();
  }

}