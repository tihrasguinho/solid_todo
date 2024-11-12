import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/find_one_todo/find_one_todo_usecase.dart';

class FindOneTodoUsecaseImp implements FindOneTodoUsecase {
  final TodosRepository repository;

  const FindOneTodoUsecaseImp(this.repository);

  @override
  Future<Result<TodosException, TodoEntity>> call(String id) async {
    if (id.isEmpty) {
      return const Left(UsecaseException('ID is empty!'));
    }

    return repository.findOneTodo(id);
  }
}
