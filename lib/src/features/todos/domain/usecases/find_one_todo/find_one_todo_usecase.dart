import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';

abstract interface class FindOneTodoUsecase {
  Future<Result<TodosException, TodoEntity>> call(String id);
}
