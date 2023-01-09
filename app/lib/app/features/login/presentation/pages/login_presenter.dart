abstract class LoginPresenter {
  Stream<String?> get emailErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get mainErrorStream;
  Stream<String?> get navegarStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  void emailValidar(String email);
  void senhaValidar(String password);
  Future<void> loginEmail();
  void dispose();
}