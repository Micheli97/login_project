import '../../domain/repositories/repositories.dart';

import 'email_validacao_repository_impl.dart';
import 'validacao_campo_impl.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  late String nomeCampo;
  List<ValidacaoCampoRepository> validations = [];

  ValidationBuilder._();

  static ValidationBuilder field(String nomeCampo) {
    _instance = ValidationBuilder._();
    _instance!.nomeCampo = nomeCampo;
    return _instance!;
  }

  ValidationBuilder required() {
    validations.add(ValidacaoCampoImpl(nomeCampo));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidacaoRepositoryImpl(nomeCampo));
    return this;
  }

  List<ValidacaoCampoRepository> build() => validations;
}