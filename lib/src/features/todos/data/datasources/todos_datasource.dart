import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/create_one_todo/create_one_todo_usecase.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/update_one_todo/update_one_todo_usecase.dart';

abstract interface class TodosDatasource {
  AsyncResult<TodosException, List<TodoEntity>> findManyTodos();
  AsyncResult<TodosException, TodoEntity> findOneTodo(String id);
  AsyncResult<TodosException, TodoEntity> createOneTodo(CreateOneTodoParams params);
  AsyncResult<TodosException, TodoEntity> updateOneTodo(UpdateOneTodoParams params);
  AsyncResult<TodosException, void> deleteOneTodo(String id);
}
