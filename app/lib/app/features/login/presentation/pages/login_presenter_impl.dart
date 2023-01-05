import 'dart:async';

import 'package:app/app/features/login/domain/usecases/login_com_email_usecase.dart';
import 'package:app/app/features/login/domain/usecases/validacao_usecase.dart';
import 'package:app/app/features/login/presentation/pages/login_presenter.dart';

class LoginState {
  String? _email;
  String? _password;
  String? emailError;
  String? mainError;
  String? passwordError;
  bool get isFormValid =>
      emailError == null &&
      passwordError == null &&
      _email != null &&
      _password != null;
  bool isLoading = false;
}

class LoginPresenterImpl implements LoginPresenter {
  final Validacao validacao;
  final LoginComEmail loginComEmail;

  final _controller = StreamController<LoginState>.broadcast();

  var _state = LoginState();

  LoginPresenterImpl({
    required this.validacao,
    required this.loginComEmail,
  });

  void _update() => _controller.add(_state);

  @override
  Future<void> loginEmail() {
    throw UnimplementedError();
  }

  @override
  void dispose() {}

  @override
  Stream<String?> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError).distinct();

  @override
  void emailValidar(String email) {
    _state._email = email;
    _state.emailError = validacao.validar(
      campo: 'email',
      valor: email,
    );
    _update();
  }

  @override
  Stream<bool> get isFormValidStream =>
      _controller.stream.map((state) => state.isFormValid).distinct();

  @override
  Stream<bool> get isLoadingStream =>
      _controller.stream.map((state) => state.isLoading).distinct();

  @override
  Stream<String?> get mainErrorStream =>
      _controller.stream.map((state) => state.mainError).distinct();

  @override
  Stream<String?> get passwordErrorStream =>
      _controller.stream.map((state) => state.passwordError).distinct();

  @override
  void senhaValidar(String password) {
    _state._email = password;
    _state.emailError = validacao.validar(
      campo: 'password',
      valor: password,
    );
    _update();
  }
}
