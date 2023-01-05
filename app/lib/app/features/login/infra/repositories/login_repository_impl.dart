import 'package:app/app/features/login/domain/repositories/login_repository.dart';
import 'package:app/app/features/login/domain/usecases/login_com_email_usecase.dart';

import '../../domain/errors/errors.dart';
import '../datasources/http/http.dart';

class LoginRepositoryImpl implements LoginRepository {
  final HttpClient client;
  final String url;

  LoginRepositoryImpl({required this.client, required this.url});

  @override
  Future<void> loginEmail(LoginComEmailCredenciais credenciais) async {
    try {
      final request = await client.request(
        url: url,
        method: 'post',
        body: LoginEmailParams.fromDomain(credenciais).toJson(),
      );
      return request;
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredencials
          : DomainError.unexpected;
    }
  }
}

class LoginEmailParams {
  final String email;
  final String senha;

  LoginEmailParams({required this.email, required this.senha});

  factory LoginEmailParams.fromDomain(LoginComEmailCredenciais credenciais) =>
      LoginEmailParams(
        email: credenciais.email,
        senha: credenciais.senha,
      );
      
  Map toJson() => {
        'email': email,
        'senha': senha,
      };
}
