import '../../domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

class ValidacaoCampoImpl extends Equatable implements ValidacaoCampoRepository {
  final String campo;

  @override
  List<Object> get props => [campo];

  const ValidacaoCampoImpl(this.campo);
  
  @override
  String? validarCampo(String value) {
    return value.isNotEmpty == true ? null : 'Campo Obrigatório';
  }
  
}