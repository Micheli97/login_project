import 'package:equatable/equatable.dart';

import '../../domain/repositories/validacao_campo_repository.dart';

class ValidacaoCampoImpl extends Equatable implements ValidacaoCampoRepository {
  @override
  final String campo;

  @override
  List<Object> get props => [campo];

  const ValidacaoCampoImpl(this.campo);
  
  @override
  String? validarCampo(String value) {
    return value.isNotEmpty ? null : 'Campo Obrigatório';
  }
  
}