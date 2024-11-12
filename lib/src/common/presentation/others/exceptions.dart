abstract class TodosException {
  final String message;
  final StackTrace? stackTrace;

  const TodosException(this.message, {this.stackTrace});
}

class UsecaseException extends TodosException {
  const UsecaseException(super.message, {super.stackTrace});
}

class RepositoryException extends TodosException {
  const RepositoryException(super.message, {super.stackTrace});
}

class UnexpectedException extends TodosException {
  const UnexpectedException(super.message, {super.stackTrace});
}
