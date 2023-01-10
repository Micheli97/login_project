import '../../domain/usecases/login_com_email_usecase.dart';

class LoginEmailModel {
  final String email;
  final String senha;

  LoginEmailModel({required this.email, required this.senha});

  factory LoginEmailModel.fromDomain(LoginComEmailCredenciais credenciais) =>
      LoginEmailModel(
        email: credenciais.email,
        senha: credenciais.senha,
      );

  Map toJson() =>
      {'email': email, 'password': senha, 'returnSecureToken': true};
}
