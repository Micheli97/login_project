abstract class Validacao {
  String? validar({required String campo, required String valor});
}

abstract class ValidacaoCampoUsecase {
  String get campo;
  String? validarCampo(String value);
}