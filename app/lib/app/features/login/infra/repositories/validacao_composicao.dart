import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class ValidacaoComposicao implements Validacao {
  final List<ValidacaoCampoRepository> validacoes;

  ValidacaoComposicao(this.validacoes);

  @override
  String? validar({required String campo, required String valor}) {
    String? error;
    for (final validacao in validacoes.where((e) => e.campo == campo)) {
      error = validacao.validarCampo(valor);
      if (error?.isNotEmpty == true) {
        return error;
      }
    }
    return null;
  }
}