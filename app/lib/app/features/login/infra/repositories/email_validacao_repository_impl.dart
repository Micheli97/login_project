import '../../domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

class EmailValidacaoRepositoryImpl extends Equatable
    implements ValidacaoCampoRepository {
  @override
  final String campo;

  const EmailValidacaoRepositoryImpl(this.campo);

  @override
  List<Object?> get props => [campo];

  @override
  String? validarCampo(String? value) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    final emailValido = value?.isNotEmpty != true || regex.hasMatch(value!);
    return emailValido ? null : 'Campo Inválido';
  }
  
}
