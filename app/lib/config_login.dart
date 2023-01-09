import 'package:http/http.dart';

import 'package:app/app/features/login/presentation/pages/login_page.dart';

import 'package:app/app/features/login/domain/usecases/usecases.dart';
import 'package:app/app/features/login/domain/repositories/repositories.dart';

import 'package:app/app/features/login/presentation/pages/login_presenter.dart';
import 'package:app/app/features/login/presentation/pages/login_presenter_impl.dart';

import 'package:app/app/features/login/infra/datasources/http/http_client.dart';
import 'package:app/app/features/login/infra/repositories/repositories.dart';

import 'package:app/app/features/login/external/datasources/http/http.dart';

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
  return LoginRepositoryImpl(
      client: httpExternal(),
      url: firebaseUrl(const String.fromEnvironment('API_KEY')));
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