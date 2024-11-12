import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';

extension type UpdateOneTodoParams._(({String id, String? title, String? Function()? subtitle, bool? done}) _params) {
  UpdateOneTodoParams(
    String id, {
    String? title,
    String? Function()? subtitle,
    bool? done,
  }) : this._((id: id, title: title, subtitle: subtitle, done: done));

  String get id => _params.id;

  String? get title => _params.title;

  String? Function()? get subtitle => _params.subtitle;

  bool? get done => _params.done;
}

abstract interface class UpdateOneTodoUsecase {
  AsyncResult<TodosException, TodoEntity> call(UpdateOneTodoParams params);
}
