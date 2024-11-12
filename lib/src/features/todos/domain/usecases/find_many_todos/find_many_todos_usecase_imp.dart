import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/find_many_todos/find_many_todos_usecase.dart';

class FindManyTodosUsecaseImp implements FindManyTodosUsecase {
  final TodosRepository repository;

  const FindManyTodosUsecaseImp(this.repository);

  @override
  AsyncResult<TodosException, List<TodoEntity>> call() {
    return repository.findManyTodos();
  }
}
