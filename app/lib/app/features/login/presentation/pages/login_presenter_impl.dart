import 'dart:async';

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

  final _controller = StreamController<LoginState>.broadcast();

  var _state = LoginState();

  LoginPresenterImpl({required this.validacao});

  @override
  Future<void> autenticacao() {
    throw UnimplementedError();
  }

  @override
  void dispose() {
  }

  @override
  Stream<String?> get emailErrorStream => throw UnimplementedError();

  @override
  void emailValidar(String email) {
  }

  @override
  Stream<bool> get isFormValidStream => throw UnimplementedError();

  @override
  Stream<bool> get isLoadingStream => throw UnimplementedError();

  @override
  Stream<String?> get mainErrorStream => throw UnimplementedError();

  @override
  Stream<String?> get passwordErrorStream => throw UnimplementedError();

  @override
  void senhaValidar(String password) {
  }

}