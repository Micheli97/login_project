import '../usecases/login_com_email_usecase.dart';

abstract class LoginRepository {
  Future<void> loginEmail (LoginComEmailCredenciais credenciais);
}