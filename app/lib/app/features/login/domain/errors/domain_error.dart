enum DomainError {
  unexpected,
  invalidCredencials,
  emailExists,
  operationNotAllowed,
  emailNotFound,
  invalidPassword,
  userDisabled,
  tooManyAttemptsTryLater,
}

extension DomainErrorExtension on DomainError {
  String get descricaoError {
    switch (this) {
      case DomainError.unexpected:
        return 'Algo de errado aconteceu';
      case DomainError.invalidCredencials:
        return 'Credenciais Inválidas';
      case DomainError.emailExists:
        return 'E-mail já cadastrado.';
      case DomainError.operationNotAllowed:
        return 'Operação não permitida!';
      case DomainError.emailNotFound:
        return 'E-mail não encontrado.';
      case DomainError.invalidPassword:
        return 'Senha inválida';
      case DomainError.tooManyAttemptsTryLater:
        return 'Acesso bloqueado temporariamente. Tente mais tarde';
      default:
        return '';
    }
  }
}
