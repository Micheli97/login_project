import 'dart:async';

import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_com_email_usecase.dart';
import '../../domain/usecases/validacao_usecase.dart';
import '../../presentation/pages/login_presenter.dart';

import '../../infra/utils/infra_error.dart';

class EstadoLogin {
  String? _email;
  String? _senha;
  String? emailError;
  String? mainError;
  String? senhaError;
  bool get formularioValido =>
      emailError == null &&
      senhaError == null &&
      _email != null &&
      _senha != null;
  bool carregando = false;
  String? navegar;
}

class LoginPresenterImpl implements LoginPresenter {
  final Validacao validacao;
  final LoginRepository loginComEmail;

  final _controller = StreamController<EstadoLogin>.broadcast();

  var _estadoLogin = EstadoLogin();

  LoginPresenterImpl({
    required this.validacao,
    required this.loginComEmail,
  });

  void _atualizarStream() => _controller.add(_estadoLogin);

  @override
  void dispose() {
    _controller.close();
  }

  @override
  Stream<String?> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError).distinct();

  @override
  void emailValidar(String email) {
    _estadoLogin._email = email;
    _estadoLogin.emailError = validacao.validar(
      campo: 'email',
      valor: email,
    );
    _atualizarStream();
  }

  @override
  Stream<bool> get formularioValidoStream =>
      _controller.stream.map((state) => state.formularioValido).distinct();

  @override
  Stream<bool> get estaCarregandoStream =>
      _controller.stream.map((state) => state.carregando).distinct();

  @override
  Stream<String?> get mainErrorStream =>
      _controller.stream.map((state) => state.mainError).distinct();

  @override
  Stream<String?> get senhaErrorStream =>
      _controller.stream.map((state) => state.senhaError).distinct();

  @override
  Stream<String?> get navegarStream =>
      _controller.stream.map((event) => event.navegar).distinct();

  @override
  void senhaValidar(String password) {
    _estadoLogin._senha = password;
    _estadoLogin.emailError = validacao.validar(
      campo: 'password',
      valor: password,
    );
    _atualizarStream();
  }

  @override
  Future<void> loginEmail() async {
    try {
      _estadoLogin.carregando = true;
      _atualizarStream();
      await loginComEmail.loginEmail(LoginComEmailCredenciais(
          email: _estadoLogin._email!, senha: _estadoLogin._senha!));
      _estadoLogin.navegar = '/success';
      _atualizarStream();
    } on InfraError catch (e) {
      _estadoLogin.mainError = e.descricaoError;
      _estadoLogin.carregando = false;
      _atualizarStream();
    }
  }
}
