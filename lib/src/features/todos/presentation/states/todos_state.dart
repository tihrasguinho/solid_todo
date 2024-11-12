import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';

sealed class TodosState {
  final List<TodoEntity> todos;
  const TodosState(this.todos);

  T when<T>({
    required T Function() onInitial,
    T Function()? onLoading,
    T Function(List<TodoEntity> todos)? onSuccess,
    T Function(String error)? onError,
  }) {
    return switch (this) {
      InitialTodosState _ => onInitial(),
      LoadingTodosState _ => onLoading?.call() ?? onInitial(),
      SuccessTodosState state => onSuccess?.call(state.todos) ?? onInitial(),
      ErrorTodosState state => onError?.call(state.error) ?? onInitial(),
    };
  }
}

final class InitialTodosState extends TodosState {
  const InitialTodosState() : super(const []);
}

final class LoadingTodosState extends TodosState {
  const LoadingTodosState() : super(const []);
}

final class SuccessTodosState extends TodosState {
  const SuccessTodosState(super.todos);
}

final class ErrorTodosState extends TodosState {
  final String error;
  const ErrorTodosState(this.error) : super(const []);
}
