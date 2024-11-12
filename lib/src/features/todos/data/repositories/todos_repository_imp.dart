import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/data/datasources/todos_datasource.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/create_one_todo/create_one_todo_usecase.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/update_one_todo/update_one_todo_usecase.dart';

class TodosRepositoryImp implements TodosRepository {
  final TodosDatasource datasource;

  const TodosRepositoryImp(this.datasource);

  @override
  AsyncResult<TodosException, TodoEntity> createOneTodo(CreateOneTodoParams params) {
    return datasource.createOneTodo(params);
  }

  @override
  AsyncResult<TodosException, void> deleteOneTodo(String id) {
    return datasource.deleteOneTodo(id);
  }

  @override
  AsyncResult<TodosException, List<TodoEntity>> findManyTodos() {
    return datasource.findManyTodos();
  }

  @override
  AsyncResult<TodosException, TodoEntity> findOneTodo(String id) {
    return datasource.findOneTodo(id);
  }

  @override
  AsyncResult<TodosException, TodoEntity> updateOneTodo(UpdateOneTodoParams params) {
    return datasource.updateOneTodo(params);
  }
}
