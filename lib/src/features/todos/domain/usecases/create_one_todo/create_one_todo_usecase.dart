import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';

extension type CreateOneTodoParams._((String title, String? subtitle) _params) {
  CreateOneTodoParams({
    required String title,
    String? subtitle,
  }) : this._((title, subtitle));

  String get title => _params.$1;

  String? get subtitle => _params.$2;
}

abstract interface class CreateOneTodoUsecase {
  AsyncResult<TodosException, TodoEntity> call(CreateOneTodoParams params);
}
