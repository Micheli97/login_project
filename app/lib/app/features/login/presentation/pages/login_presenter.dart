abstract class LoginPresenter {
  Stream<String?> get emailErrorStream;
  Stream<String?> get senhaErrorStream;
  Stream<String?> get mainErrorStream;
  Stream<String?> get navegarStream;
  Stream<bool> get formularioValidoStream;
  Stream<bool> get estaCarregandoStream;

  void emailValidar(String email);
  void senhaValidar(String password);
  Future<void> loginEmail();
  void dispose();
}