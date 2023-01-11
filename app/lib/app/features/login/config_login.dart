import 'package:http/http.dart';

import './domain/repositories/login_repository.dart';
import './domain/repositories/validacao_campo_repository.dart';
import './domain/usecases/validacao_usecase.dart';

import './presentation/pages/login_page.dart';

import './presentation/pages/login_presenter.dart';
import './presentation/pages/login_presenter_impl.dart';

import './infra/repositories/login_repository_impl.dart';
import './infra/repositories/validacao_composicao.dart';
import './infra/repositories/validation_builder.dart';
import '../../core/http/http_client.dart';

import '../../core/http/http_cilent_external.dart';

LoginPage loginPage() {
  return LoginPage(presenter: criarLoginPresenter());
}

String firebaseUrl(String key) =>
    'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$key';

HttpClient httpExternal() {
  final client = Client();
  return HttpClientExternal(client);
}

LoginRepository loginEmail() {
  final cabecalho = {'content-type': 'application/json'};
  const metodoHttp = 'post';
  return LoginRepositoryImpl(
    client: httpExternal(),
    cabecalho: cabecalho,
    url: firebaseUrl(const String.fromEnvironment('API_KEY')),
    metodoHttp: metodoHttp,
  );
}

List<ValidacaoCampoRepository> composicaoLogin() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}

Validacao validacao() {
  return ValidacaoComposicao(composicaoLogin());
}

LoginPresenter criarLoginPresenter() {
  return LoginPresenterImpl(
      validacao: validacao(), loginComEmail: loginEmail());
}
