import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/delete_one_todo/delete_one_todo_usecase.dart';

class DeleteOneTodoUsecaseImp implements DeleteOneTodoUsecase {
  final TodosRepository repository;

  const DeleteOneTodoUsecaseImp(this.repository);

  @override
  AsyncResult<TodosException, void> call(String id) async {
    if (id.isEmpty) {
      return const Left(UsecaseException('ID is empty!'));
    }

    return repository.deleteOneTodo(id);
  }
}
