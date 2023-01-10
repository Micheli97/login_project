import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_com_email_usecase.dart';
import '../../domain/errors/domain_error.dart';

import '../../external/datasources/http/http_error.dart';

import '../../../../core/http/http_client.dart';

class LoginRepositoryImpl implements LoginRepository {
  final HttpClient client;
  final String url;

  LoginRepositoryImpl({required this.client, required this.url});

  @override
  Future<void> loginEmail(LoginComEmailCredenciais credenciais) async {
    try {
      await client.request(
        url: url,
        method: 'post',
        body: LoginEmailParams.fromDomain(credenciais).toJson(),
      );
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.operationNotAllowed
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

  Map toJson() =>
      {'email': email, 'password': senha, 'returnSecureToken': true};
}
