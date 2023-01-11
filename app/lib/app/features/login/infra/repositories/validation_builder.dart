import '../../domain/repositories/validacao_campo_repository.dart';

import 'email_validacao_repository_impl.dart';
import 'validacao_campo_impl.dart';

class ValidacaoConstrutor {
  static ValidacaoConstrutor? _instance;
  late String nomeCampo;
  List<ValidacaoCampoRepository> validacoes = [];

  ValidacaoConstrutor._();

  static ValidacaoConstrutor field(String nomeCampo) {
    _instance = ValidacaoConstrutor._();
    _instance!.nomeCampo = nomeCampo;
    return _instance!;
  }

  ValidacaoConstrutor requer() {
    validacoes.add(ValidacaoCampoImpl(nomeCampo));
    return this;
  }

  ValidacaoConstrutor email() {
    validacoes.add(EmailValidacaoRepositoryImpl(nomeCampo));
    return this;
  }

  List<ValidacaoCampoRepository> construir() => validacoes;
}