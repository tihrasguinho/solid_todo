import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';

abstract interface class DeleteOneTodoUsecase {
  AsyncResult<TodosException, void> call(String id);
}
