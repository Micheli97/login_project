import '../usecases/usecases.dart';

abstract class LoginRepository {
  Future<void> loginEmail (LoginComEmailCredenciais credenciais);
}