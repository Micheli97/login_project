import 'package:app/app/features/login/infra/models/login_email_model.dart';

import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_com_email_usecase.dart';
import '../../domain/errors/domain_error.dart';

import '../../../../core/http/utils/http_error.dart';

import '../../../../core/http/http_client.dart';

class LoginRepositoryImpl implements LoginRepository {
  final HttpClient client;
  final String url;
  final Map<String, String> cabecalho;
  final String metodoHttp;

  LoginRepositoryImpl(
      {required this.client, required this.url, required this.cabecalho, required this.metodoHttp});

  @override
  Future<void> loginEmail(LoginComEmailCredenciais credenciais) async {
    try {
      await client.request(
        url: url,
        method: metodoHttp,
        headers: cabecalho,
        body: LoginEmailModel.fromDomain(credenciais).toJson(),
      );
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.operationNotAllowed
          : DomainError.unexpected;
    }
  }
}
