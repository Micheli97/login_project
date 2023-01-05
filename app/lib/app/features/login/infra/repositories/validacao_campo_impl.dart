import '../../domain/usecases/usecases.dart';
import 'package:equatable/equatable.dart';

class ValidacaoCampoImpl extends Equatable implements ValidacaoCampoUsecase {
  final String campo;

  @override
  List<Object> get props => [campo];

  const ValidacaoCampoImpl(this.campo);
  
  @override
  String? validarCampo(String value) {
    return value.isNotEmpty == true ? null : 'Campo Obrigatório';
  }
  
}