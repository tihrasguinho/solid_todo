import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/update_one_todo/update_one_todo_usecase.dart';

class UpdateOneTodoUsecaseImp implements UpdateOneTodoUsecase {
  final TodosRepository repository;

  const UpdateOneTodoUsecaseImp(this.repository);

  @override
  AsyncResult<TodosException, TodoEntity> call(UpdateOneTodoParams params) async {
    if (params.id.isEmpty) {
      return const Left(UsecaseException('ID is empty!'));
    }

    if (params.title != null && params.title?.isEmpty == true) {
      return const Left(UsecaseException('Title is empty!'));
    }

    if (params.subtitle != null && params.subtitle?.call()?.isEmpty == true) {
      return const Left(UsecaseException('Subtitle is empty!'));
    }

    return repository.updateOneTodo(params);
  }
}
