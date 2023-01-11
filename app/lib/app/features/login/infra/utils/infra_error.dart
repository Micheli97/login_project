enum InfraError {
  unexpected,
  invalidCredencials,
  emailExists,
  operationNotAllowed,
  emailNotFound,
  invalidPassword,
  userDisabled,
  tooManyAttemptsTryLater,
}

extension DomainErrorExtension on InfraError {
  String get descricaoError {
    switch (this) {
      case InfraError.unexpected:  
        return 'Algo de errado aconteceu';
      case InfraError.invalidCredencials:
        return 'Credenciais Inválidas';
      case InfraError.emailExists:
        return 'E-mail já cadastrado.';
      case InfraError.operationNotAllowed:
        return 'Operação não permitida!';
      case InfraError.emailNotFound:
        return 'E-mail não encontrado.';
      case InfraError.invalidPassword:
        return 'Senha inválida';
      case InfraError.tooManyAttemptsTryLater:
        return 'Acesso bloqueado temporariamente. Tente mais tarde';
      default:
        return '';
    }
  }
}
