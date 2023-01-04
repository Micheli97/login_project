enum DomainError {
  unexpected,
  invalidCredencials
}

extension DomainErrorExtension on DomainError {
  String get descricaoError {
    switch (this) {
      case DomainError.unexpected:
        return 'Algo de errado aconteceu';
      case DomainError.invalidCredencials:
        return 'Credenciais Inválidas';
      default:
        return '';
    }
  }
}